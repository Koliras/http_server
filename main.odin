package main

import "core:fmt"
import "core:net"
import "core:os"
import "core:strings"

import "./http"

main :: proc() {
	endpoint, ok := net.parse_endpoint("127.0.0.1:8888")
	if !ok {
		fmt.println("Parse error")
		os.exit(1)
	}
	socket, err := net.listen_tcp(endpoint)
	if err != nil {
		fmt.println("Error: ", err)
		os.exit(1)
	}
	defer net.close(socket)
	fmt.println("Started tcp server at 127.0.0.1:8888")
	for true {
		client, source, accept_err := net.accept_tcp(socket)
		if accept_err != nil {
			fmt.println("Error while accepting request:", accept_err)
			continue
		}
		defer net.close(client)

		buf := [1024]u8{}
		data_read, recv_err := net.recv_tcp(client, buf[:])
		if recv_err != nil {
			fmt.println("Error when reading data of request:", recv_err)
			continue
		}
		res := http.Response {
			headers = make(map[string]string),
			body    = make([dynamic]byte),
		}
		defer delete(res.body)
		defer delete(res.headers)
		handle_request(buf[:], &res)
		response_buffer := make([dynamic]byte, 0, len(res.body))
		http.response_to_bytes(&res, &response_buffer)
		data_sent, send_err := net.send_tcp(client, response_buffer[:])
		if send_err != nil {
			fmt.println("Error when sending data to client:", send_err)
			continue
		}
		fmt.println("Sent response", data_sent, response_buffer)
	}
}

handle_request :: proc(data: []byte, res: ^http.Response) {
}
