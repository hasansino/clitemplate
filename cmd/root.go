package cmd

import (
	"log"

	"github.com/spf13/cobra"
)

var rootCmd = &cobra.Command{
	Use:   "clitemplate",
	Short: "A simple template for new cli projects",
}

func init() {
	cobra.OnInitialize()
	rootCmd.AddCommand(exampleCmd)
}

func Execute() {
	if err := rootCmd.Execute(); err != nil {
		log.Fatal(err)
	}
}
