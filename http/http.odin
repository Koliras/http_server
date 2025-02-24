package http

import "core:bytes"
import "core:fmt"
import "core:strconv"
import "core:strings"

response_to_bytes :: proc(res: ^Response, buf: ^[dynamic]byte) {
	append(buf, fmt.aprint("HTTP/1.1", res.status, Status_Text[res.status], "\r\n"))
	for header, value in res.headers {
		append(buf, header)
		append(buf, ": ")
		append(buf, value)
		append(buf, "\r\n")
	}
	append(buf, "\r\n")
	for b in res.body {
		append(buf, b)
	}
}

Request_Parse_Error :: enum {
	None = 0,
	Incorrect_Request_Line_Format,
	Unknown_Method,
}

request_from_bytes :: proc(req_bytes: []byte, req: ^Request) -> Request_Parse_Error {
	lines := bytes.split(req_bytes, []byte{13, 10}) // split by "\r\n"
	request_line := bytes.split(lines[0], []byte{32}) // split by " "
	if len(request_line) != 3 {
		return .Incorrect_Request_Line_Format
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
	case:
		return .Unknown_Method
	}

	line_index: int = 1
	for ; line_index < len(lines); line_index += 1 {
		line := lines[line_index]
		if string(line) == "\r\n" {
			break
		}
		header_string := bytes.split_n(lines[line_index], []byte{58, 32}, 2) // split by ": "
		if len(header_string) != 2 {
			continue
		}
		req.headers[string(header_string[0])] = strings.clone_from_bytes(header_string[1])
	}

	// body_buffer_len := strconv.atoi(req.headers["Content-Length"])
	// body := make([dynamic]byte, 0, body_buffer_len)
	// defer delete(body)

	req.path = strings.clone_from_bytes(request_line[1])
	req.version = strings.clone_from_bytes(request_line[2])

	return nil
}
