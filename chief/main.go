package main

import (
	"log"

	"github.com/hajimehoshi/ebiten/v2"
	"github.com/hajimehoshi/ebiten/v2/ebitenutil"
)

var (
	Lives   int    = 3
	Score   int    = 0
	Running bool   = true
	Width   int    = 320
	Height  int    = 240
	Title   string = "Chief"
)

type BriefScreen struct {
	image string
	text  string
}

type Brief []BriefScreen

type Game struct{}

func (g *Game) Update() error {
	return nil
}

func (g *Game) Draw(screen *ebiten.Image) {
	ebitenutil.DebugPrint(screen, Title)
}

func (g *Game) Layout(w, h int) (sW, sH int) {
	return Width, Height
}

func main() {
	ebiten.SetWindowSize(Width, Height)
	ebiten.SetWindowTitle(Title)
	if err := ebiten.RunGame(&Game{}); err != nil {
		log.Fatal(err)
	}
}
