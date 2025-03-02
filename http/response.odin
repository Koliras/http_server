package http

import "core:bytes"
import "core:fmt"
import "core:strconv"
import "core:strings"

Response :: struct {
	status:  Status_Code,
	headers: map[string]string,
	body:    [dynamic]byte,
	version: string,
}

response_init :: proc(res: ^Response, version := "HTTP/1.1") {
	res.status = .OK
	res.headers = make(map[string]string)
	res.body = make([dynamic]byte)
	res.version = version
}

response_delete :: proc(res: ^Response) {
	delete(res.headers)
	delete(res.body)
}

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
