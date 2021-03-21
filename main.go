package main

import (
	"log"
	"os"

	gcli "github.com/bonedaddy/go-template/cli"
)

var (
	// Version denotes the compile time build version
	Version string
)

func main() {
	name := "go-template"
	usage := "go-template cli"
	app := gcli.New(name, usage, Version)
	if err := app.Run(os.Args); err != nil {
		log.Println("encountered error during cli operation: ", err)
		os.Exit(1)
	}
	os.Exit(1)
}
