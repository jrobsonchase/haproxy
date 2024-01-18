package main

import (
	"log"
	"net/http"
	"time"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		time.Sleep(1 * time.Millisecond)
	})
	log.Print("Starting server")
	log.Fatal(http.ListenAndServe(":8234", nil))
}
