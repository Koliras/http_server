package http

import "core:bytes"
import "core:fmt"
import "core:strconv"
import "core:strings"

response_to_bytes :: proc(res: ^Response, buf: ^[dynamic]byte) {
	append(buf, fmt.aprintf("%s %d %s\r\n", res.version, res.status, Status_Text[res.status]))
	for header, value in res.headers {
		append(buf, header)
		append(buf, ": ")
		append(buf, value)
		append(buf, "\r\n")
	}
	append(buf, "\r\n")
	append(buf, string(res.body[:]))
}

Request_Parse_Error :: enum {
	None = 0,
	Incorrect_Request_Line_Format,
	Unknown_Method,
	Too_Short_Request_Data,
}

request_from_bytes :: proc(req_bytes: []byte) -> (Request, Request_Parse_Error) {
	req := Request{}
	if len(req_bytes) < 12 {
		return req, .Too_Short_Request_Data
	}
	parts := bytes.split(req_bytes, []byte{13, 10, 13, 10}) // split by "\r\n"
	headers_part := bytes.split(parts[0], []byte{13, 10}) // split by "\r\n"
	request_line := bytes.split(headers_part[0], []byte{32}) // split by " "
	if len(request_line) < 2 {
		return req, .Incorrect_Request_Line_Format
	}
	method := string(request_line[0])
	switch method {
	case "GET":
		req.method = .Get
	case "POST":
		req.method = .Post
	case "DELETE":
		req.method = .Delete
	case "PUT":
		req.method = .Put
	case "PATCH":
		req.method = .Patch
	case "OPTIONS":
		req.method = .Options
	case "TRACE":
		req.method = .Trace
	case "HEAD":
		req.method = .Head
	case "CONNECT":
		req.method = .Connect
	case:
		return req, .Unknown_Method
	}

	req.headers = make(map[string]string)
	line_index: int = 1
	for ; line_index < len(headers_part); line_index += 1 {
		line := headers_part[line_index]
		if string(line) == "\r\n" {
			break
		}
		header_string := bytes.split_n(headers_part[line_index], []byte{58, 32}, 2) // split by ": "
		if len(header_string) != 2 {
			continue
		}
		req.headers[string(header_string[0])] = string(header_string[1])
	}

	if len(parts) == 2 {
		req.body = strings.clone_from_bytes(parts[1])
	}

	req.url = url_parse(string(request_line[1]))
	if len(request_line) == 3 {
		req.version = string(request_line[2])
	} else {
		req.version = "HTTP/1.1"
	}

	return req, nil
}
