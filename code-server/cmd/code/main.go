package main

import (
	"fmt"
	"log"
	"os"
	"path/filepath"

	project "github.com/ar90n/code-code-server"
	"github.com/ar90n/code-code-server/devcontainer"
	"github.com/ar90n/code-code-server/settings/gist"
	"github.com/urfave/cli/v2"
)

func prettyUrlPrint(url project.ServiceURL) {
	log.Printf("==============================================================================================")
	log.Printf("Code Server running at %s", url.String())
	log.Printf("==============================================================================================")
}

func main() {
	app := &cli.App{
		Name:    "code",
		Version: "0.1.0",
		Usage:   "code",
		Action: func(c *cli.Context) error {
			if c.Args().Len() == 0 {
				return fmt.Errorf("Please provide a project directory")
			}

			projectDirPath := c.Args().Get(0)
			if _, err := os.Stat(projectDirPath); os.IsNotExist(err) {
				return fmt.Errorf("Project directory does not exist")
			}

			devcontainerDirPath := filepath.Join(projectDirPath, ".devcontainer")
			if _, err := os.Stat(devcontainerDirPath); os.IsNotExist(err) {
				return fmt.Errorf("Project directory does not contain a .devcontainer directory")
			}

			devcontainerJsonPath := filepath.Join(devcontainerDirPath, "devcontainer.json")
			devcontainerObj, err := devcontainer.ParseJson(devcontainerJsonPath)
			if err != nil {
				return err
			}

			settingsRepository, err := gist.New()
			if err != nil {
				return err
			}

			tag, err := project.BuildImage(devcontainerObj, &settingsRepository)
			if err != nil {
				return err
			}

			url, err := project.GetServiceURL(devcontainerObj)
			if err != nil {
				return err
			}

			ctx, err := project.NewContainerContext(tag, devcontainerObj, url)
			if err != nil {
				return err
			}

			prettyUrlPrint(url)
			ctx.Run()

			return nil
		},
	}

	err := app.Run(os.Args)
	if err != nil {
		log.Fatal(err)
	}
}
