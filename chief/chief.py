import os
import sys
import pygame
from briefs import Brief

ROOT = os.path.split(os.path.abspath(__file__))[0]


class Game(pygame.sprite.Sprite):
    def __init__(self):
        pygame.sprite.Sprite.__init__(self)
        self.x = 0
        self.y = 0

    def update(self, x, y: int):
        self.x = x
        self.y = y
        return False


class Chief:
    def __init__(self):
        self.x = 0
        self.y = 0
        self.TITLE = True
        self.BRIEF = False
        self.GAME = False
        self.height = 480
        self.width = 640
        self.FPS = 30
        self.title_name = "Chief"
        pygame.init()
        pygame.display.set_caption(self.title_name)
        self.screen = pygame.display.set_mode((self.width, self.height))
        self.title_font = pygame.font.Font("st-tng-title.ttf", 96)
        self.brief_font = pygame.font.Font(None, 48)
        self.brief = Brief(ROOT)
        self.game = Game()

    def __call__(self):
        self.run()

    def run(self):
        self.clock = pygame.time.Clock()
        while True:
            for e in pygame.event.get():
                if e.type == pygame.QUIT:
                    pygame.quit()
                    sys.exit()
                # Update
                if e.type == pygame.KEYDOWN:
                    if self.TITLE and e.key == pygame.K_SPACE:
                        self.TITLE = False
                        self.BRIEF = True
                        self.GAME = False
                    if self.BRIEF and e.key == pygame.K_SPACE:
                        self.BRIEF = self.brief.update()
                        if not self.BRIEF:
                            self.GAME = True

                    if self.GAME:
                        if e.key == pygame.K_a or pygame.K_LEFT:
                            self.x -= 1
                        if e.key == pygame.K_d or pygame.K_RIGHT:
                            self.x += 1
                        if e.key == pygame.K_w or pygame.K_UP:
                            self.y += 1
                        if e.key == pygame.K_s or pygame.K_DOWN:
                            self.y -= 1

                        self.GAME = self.game.update(self.x, self.y)
                        if not self.GAME:
                            self.x = 0
                            self.y = 0
                            self.BRIEF = True

                if self.TITLE:
                    self.screen.fill("black")
                    t = self.title_font.render(self.title_name, True, (255, 255, 255))
                    self.screen.blit(t, (30, 30))

                if self.BRIEF:
                    self.screen.fill("black")
                    self.screen.blit(self.brief.image, (0, 0))
                    t = self.brief_font.render(self.brief.text, True, (255, 255, 255))
                    self.screen.blit(t, (20, 400))
                    pygame.display.flip()

                if self.GAME:
                    self.screen.fill("black")
                    t = self.brief_font.render("GAME", True, (255, 255, 255))
                    self.screen.blit(t, (20, 400))

                pygame.display.update()
                self.clock.tick(self.FPS)


if __name__ == "__main__":
    c = Chief()
    c()
