package http

import "core:strings"

URL :: struct {
	raw:   string,
	path:  string,
	query: string,
}

url_parse :: proc(raw: string) -> (url: URL) {
	url.raw = raw
	s := raw

	i := strings.index(s, "?")
	if i != -1 {
		url.query = s[i + 1:]
		s = s[:i]
	}

	i = strings.index(s, "/")
	if i != -1 {
		url.path = s[i:]
	}

	return
}
