import pygame as pg


class Chief:
    def __init__(self):
        self.x = 0
        self.y = 0
        self.TITLE = True
        self.BRIEF = False
        self.GAME = False
        self.height = 320
        self.width = 480
        self.FPS = 30
        self.x = 0
        self.y = 0
        self.title = "Chief"
        pg.init()
        self.screen = pg.display.set_mode(self.width, self.height)
        pg.display.set_caption(self.title)
        self.clock = pg.time.Clock()

    def __call__(self):
        self.run()

    def run(self):
        while True:
            for e in pygame.event.get():
                if e.type == pg.QUIT:
                    pg.quit()

            self.screen.fill("black")
            pg.display.update()
            self.clock.tick(self.FPS)


if __name__ == "__main__":
    c = Chief()
    c()
