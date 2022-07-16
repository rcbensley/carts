import pygame as pg


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
        self.x = 0
        self.y = 0
        self.title = "Chief"

    def __call__(self):
        self.run()

    def run(self):
        pg.init()
        title_font = pg.font.Font("st-tng-title.ttf", 24)
        self.screen = pg.display.set_mode((self.width, self.height))
        pg.display.set_caption(self.title)
        self.clock = pg.time.Clock()
        while True:
            for e in pg.event.get():
                if e.type == pg.QUIT:
                    pg.quit()

            if self.title:
                self.screen.fill("black")
                t = title_font.render("Chief", True, (255, 255, 255))
                self.screen.blit(t, (300, 300))

            pg.display.update()
            self.clock.tick(self.FPS)


if __name__ == "__main__":
    c = Chief()
    c()
