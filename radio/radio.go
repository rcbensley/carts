package main

import (
	"fmt"
	"strings"
)

const (
	alphabet string = "abcdefghijklmnopqrstuvwxyz"
)

var (
	gameOffsets = []int{-4, -3, -2, -1, 1, 2, 3, 4}
	games       = []string{}
)

func init() {
	for _, o := range gameOffsets {
		var s = []string{}
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

			l := string(alphabet[j])
			s = append(s, l)
		}
		newAlphabet := strings.Join(s, "")
		games = append(games, newAlphabet)
	}
}

func main() {
	for i := range games {
		fmt.Println(games[i])
	}
}
