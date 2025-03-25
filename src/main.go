package main

import (
	"fmt"
	"net/http"
)

func main() {
	fmt.Println("Hello Testing!")

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintln(w, "Hello, Testing!")
	})

	http.ListenAndServe(":8080", nil) // Keeps the app running
}
