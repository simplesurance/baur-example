package main

import (
	"fmt"
	"os"

	"github.com/simplesurance/random/generator"

	"github.com/fatih/color"
)

var Version = "undefined"

func main() {
	if len(os.Args) == 2 && (os.Args[1] == "-v") {
		fmt.Printf("rng version %s\n", Version)
		os.Exit(0)
	}

	fmt.Println(color.RedString("%d", generator.RandomNumber))
}
