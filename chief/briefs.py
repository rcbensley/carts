import os
import pygame


class Brief:
    def __init__(self, root: str):
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

    def brief_image(self):
        return self.images[self.briefs[self.i][self.j][0]]

    def brief_text(self):
        return self.briefs[self.i][self.j][1]

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
