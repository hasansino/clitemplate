package cmd

import (
	"fmt"

	"github.com/spf13/cobra"
)

var exampleCmd = &cobra.Command{
	Use:   "example",
	Short: "Example command",
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Println("Hello World!")
	},
}
