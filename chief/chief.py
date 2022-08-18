#!/usr/bin/env python3
import os
import sys
import pygame
from game import Game

TITLE = "Chief"
FONT = "st-tng-title.ttf"
ROOT = os.path.split(os.path.abspath(__file__))[0]
FPS = 30

class Brief:
    def __init__(self, font: str, root: str):
        pygame.sprite.Sprite.__init__(self)
        self.i = 0
        self.j = 0
        self.briefs = [
            [
                [0, "Chief!"],
                [0, "It's Commander Riker's Birthday"],
                [3, "..."],
                [1, "Isn't he a scamp?"],
            ],
            [
                [0, "Chief!"],
                [3, "Yes sir"],
                [1, "Riker's used his 14 days shore leave, in the holodeck again"],
                [5, "..."],
                [2, "Be a dear and scrub the holo-filters"],
            ],
        ]
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

        self.image = self.brief_image()
        self.text = self.brief_text()
        self.brief_font = pygame.font.Font(font,20)

    def brief_image(self):
        return self.images[self.briefs[self.i][self.j][0]]

    def brief_text(self):
        return self.briefs[self.i][self.j][1]

    def __call__(self, s: pygame.Surface):
        s.fill("black")
        s.blit(self.brief.image, (0, 0))
        t = self.brief_font.render(self.brief.text, True, (255, 255, 255))
        s.blit(t, (20, 400))
        pygame.display.flip()
        return 

    def update(self):
        self.image = self.images[self.briefs[self.i][self.j][0]]
        self.text = self.briefs[self.i][self.j][1]
        if self.j >= len(self.briefs[self.i]):
            if self.i >= len(self.briefs):
                self.i = 0
            else:
                self.i += 1
            self.j = 0
            return False
        else:
            self.j += 1
        return True


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
