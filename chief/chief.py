#!/usr/bin/env python3
import os
import sys
import pygame


class Brief:
    def __init__(self):
        pygame.sprite.Sprite.__init__(self)
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
        self.mission = 0
        self.index = 0
        self.count = len(self.briefs)

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
        self.brief_font = pygame.font.Font(font, 20)

    def next(self):
        if self.index >= len(self.briefs[self.mission]):
            self.index = 0
            if self.mission >= self.count:
                self.mission = 1
            return True
        else:
            self.index += 1
            return False

    def __call__(self):
        image = self.images[self.briefs[self.mission][self.index][0]]
        text = self.briefs[self.mission][self.index][1]
        screen.fill("black")
        screen.blit(image, (0, 0))
        text = self.brief_font.render(text, True, (255, 255, 255))
        screen.blit(text, (20, 400))
        pygame.display.flip()

        for e in pygame.event.get():
            if e.type == pygame.QUIT:
                pygame.quit()
                sys.exit()
            if e.type == pygame.KEYDOWN and e.key == pygame.K_ESCAPE:
                return False
            if e.type == pygame.KEYDOWN and e.key == pygame.K_SPACE:
                self.brief()

        pygame.display.update()
        clock.tick(fps)


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

    while running:
        screen.fill("black")
        title = title_font.render(title, True, (255, 255, 255))
        screen.blit(title, (30, 30))

        for e in pygame.event.get():
            if e.type == pygame.QUIT:
                pygame.quit()
                sys.exit()
            if e.type == pygame.KEYDOWN and e.key == pygame.K_ESCAPE:
                running = False
            if e.type == pygame.KEYDOWN and e.key == pygame.K_SPACE:
                brief()

        pygame.display.update()
        clock.tick(fps)

    pygame.quit()
    sys.exit()
