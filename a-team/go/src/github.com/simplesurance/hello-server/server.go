package main

import (
	"fmt"
	"net/http"

	"github.com/simplesurance/lib/hello"
)

func main() {
	const listenAddr = "localhost:8081"

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, hello.String())
	})

	fmt.Printf("listening on http://%s\n", listenAddr)

	err := http.ListenAndServe(listenAddr, nil)
	if err != nil {
		fmt.Println(err)
	}
}
