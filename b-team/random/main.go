package main

import (
	"fmt"

	"github.com/simplesurance/random/generator"

	"github.com/fatih/color"
)

func main() {
	fmt.Println(color.RedString("%d", generator.RandomNumber))
}
