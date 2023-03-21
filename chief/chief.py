#!/usr/bin/env python3
import os
import sys
import pygame
from briefs import briefs


def play_mission(m: list, i: int):
    m[i]()


class Brief:
    def __init__(self):
        self.brief = 0
        self.index = 0
        self.count = len(briefs)
        self.image = None
        self.brief_text = None
        self.text = None

        self.image_files = [
            "cpt_order.png",
            "cpt_quiz.png",
            "cpt_silly.png",
            "ob_yes.png",
            "ob_what.png",
            "ob_gross.png",
        ]
        self.images = []
        for i in self.image_files:
            p = os.path.join(root, "img", i)
            s = pygame.image.load(p).convert()
            self.images.append(s)

        self.brief_font = pygame.font.Font(font, 20)

    def update(self, m: int):
        if self.index >= len(self.briefs[m]):
            self.index = 0
            if self.mission >= self.count:
                self.mission = 1
        else:
            self.index += 1

        self.image = self.images[self.briefs[m][self.index][0]]
        self.brief_text = self.briefs[m][self.index][1]
        self.text = self.brief_font.render(self.brief_text, True, (255, 255, 255))

    def draw(self, m: int):
        screen.fill("black")
        screen.blit(self.image, (0, 0))
        screen.blit(self.text, (20, 400))
        pygame.display.flip()


if __name__ == "__main__":
    running = True
    width = 640
    height = 480
    title = "Chief"
    font = "st-tng-title.ttf"
    root = os.path.split(os.path.abspath(__file__))[0]
    fps = 30
    pygame.init()
    pygame.display.set_caption(title)
    screen = pygame.display.set_mode((width, height))
    clock = pygame.time.Clock()
    brief = Brief()
    title_font = pygame.font.Font(font, 96)
    missions = []
    mission = 0
    mode = 0  # menu, brief, game

    while running:
        screen.fill("black")
        text = title_font.render(title, True, (255, 255, 255))
        screen.blit(text, (30, 30))

        for e in pygame.event.get():
            if e.type == pygame.QUIT:
                running = False
            if e.type == pygame.KEYDOWN and e.key == pygame.K_ESCAPE:
                running = False
            if e.type == pygame.KEYDOWN and e.key == pygame.K_SPACE:
                brief(mission)

        pygame.display.update()
        clock.tick(fps)

    pygame.quit()
    sys.exit()
