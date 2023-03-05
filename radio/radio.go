package main

import (
	"fmt"

	rl "github.com/gen2brain/raylib-go/raylib"
)

const (
	alphabet string = "abcdefghijklmnopqrstuvwxyz"
)

var (
	gameOffsets = []int{-4, -3, -2, -1, 1, 2, 3, 4}
	games       = [][]int{}
)

func init() {
	for _, o := range gameOffsets {
		var game = []int{}
		var j int
		var diff int
		for i := 0; i <= 25; i++ {
			j = i + o
			if j < 0 {
				diff = 0 - j
				j = 25 - diff
			} else if j >= 25 {
				diff = j - 25
				j = 0 + diff
			}

			game = append(game, j)
		}
		games = append(games, game)
	}
}

func main() {
	for i := range games {
		a := []string{}
		for _, j := range games[i] {
			a = append(a, string(alphabet[j]))
		}
		fmt.Println(a)
	}

	rl.InitWindow(800, 450, "raylib [core] example - basic window")
	rl.SetTargetFPS(60)

	for !rl.WindowShouldClose() {
		rl.BeginDrawing()

		rl.ClearBackground(rl.RayWhite)
		rl.DrawText("Congrats! You created your first window!", 190, 200, 20, rl.LightGray)

		rl.EndDrawing()
	}

	rl.CloseWindow()
}
