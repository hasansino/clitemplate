package main

import (
	"math/rand"
	"time"

	"github.com/hasansino/clitemplate/cmd"
)

// this variables are passed as arguments upon build
var (
	buildDate   string
	buildCommit string
)

func init() {
	rand.Seed(time.Now().Unix())

	if len(buildDate) == 0 {
		buildDate = "dev"
	}
	if len(buildCommit) == 0 {
		buildCommit = "dev"
	}
}

func main() {
	cmd.Execute()
}
