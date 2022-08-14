#!/usr/bin/env python3
import os
import sys
import pygame
from briefs import Brief


def main_menu(s: pygame.Surface):
    running = True
    while running:
        for e in pygmae.event.get():
            if e.type == pygame.QUIT:
                pygame.quit()
                sys.exit()
            if e.type == pygame.KEYDOWN:
                if e.key == pygame.K_SPACE:
                    running = False
                    continue

        s.fill("black")
        title_font = pygame.font.Font(FONT, 96)
        title = title_font.render(TITLE, True, (255, 255, 255))
        s.blit(t, (30, 30))


def next_mission():
    pass

def main():
    ROOT = os.path.split(os.path.abspath(__file__))[0]
    TITLE = "Chief"
    FONT = "st-tng-title.ttf"
    FPS = 30
    state = 0
    running = True
    m = 0
    width = 640
    height = 480
    pygame.init()
    pygame.display.set_caption(TITLE)
    screen = pygame.display.set_mode((width, height))
    b = Brief(ROOT)
    c = Chief()
    clock = pygame.time.Clock()
    while running:
        if state == 0:
            state, missions = main_menu(screen)
        if state == 1:
            state = b(m)
        if state == 2:
            state = c(m)

        pygame.display.update()
        clock.tick(FPS)
        m = next_mission()

if __name__ == "__main__":
    main()
