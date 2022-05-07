package main
import (
    "fmt"
    "net/http"
)

func IndexHandler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintln(w, "hello docker")
}

func main() {
    http.HandleFunc("/", IndexHandler)
    err := http.ListenAndServe("0.0.0.0:8090", nil)
    if err != nil {
        fmt.Println(err)
    }
}