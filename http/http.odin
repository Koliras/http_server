package http

import "core:fmt"

response_to_bytes :: proc(res: ^Response, buf: ^[dynamic]byte) {
	append(buf, fmt.aprint("HTTP/1.1 %d %s\r\n", res.status, Status_Text[res.status]))
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
