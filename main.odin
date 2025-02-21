package main

import "core:fmt"
import "core:net"
import "core:os"
import "core:strings"

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
		fmt.println("Connected by", source.address)
		buf := [1024]u8{}
		data_read, recv_err := net.recv_tcp(client, buf[:])
		if recv_err != nil {
			fmt.println("Error when reading data of request:", recv_err)
			continue
		}
		data_sent, send_err := net.send_tcp(client, buf[:])
		if send_err != nil {
			fmt.println("Error when sending data to client:", send_err)
			continue
		}
		str := strings.clone_from_bytes(buf[:]) or_continue
		fmt.println("Data:", str)
	}
}
