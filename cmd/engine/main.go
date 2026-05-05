package main

import (
	"log"

	"github.com/RafaZeero/game-engine/internal/engine"
)

func main() {
	if err := engine.Run(); err != nil {
		log.Fatal(err)
	}
}
