#!/usr/bin/env python3
import os
import sys
import pygame
from briefs import Brief
from game import Game

TITLE = "Chief"
FONT = "st-tng-title.ttf"
ROOT = os.path.split(os.path.abspath(__file__))[0]
FPS = 30


def main_menu(s: pygame.Surface, c: pygame.time.Clock):
    while True:
        s.fill("black")
        title_font = pygame.font.Font(FONT, 96)
        title = title_font.render(TITLE, True, (255, 255, 255))
        s.blit(title, (30, 30))

        for e in pygame.event.get():
            if e.type == pygame.QUIT:
                pygame.quit()
                sys.exit()
            if e.type == pygame.KEYDOWN and e.key == pygame.K_ESCAPE:
                return False
            if e.type == pygame.KEYDOWN and e.key == pygame.K_SPACE:
                game(s)

        pygame.display.update()
        c.tick(FPS)


def game(s: pygame.Surface):
    pass


def main():
    running = True
    width = 640
    height = 480
    pygame.init()
    pygame.display.set_caption(TITLE)
    screen = pygame.display.set_mode((width, height))
    clock = pygame.time.Clock()
    while running:
        running = main_menu(screen, clock)


if __name__ == "__main__":
    main()
