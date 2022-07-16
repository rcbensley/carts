import os
import pygame as pg


class Briefs:
    def __init__(self, root: str):
        self.brief = 0
        self.i = 0
        self.briefs = [
            [],
            [
                [0, "Chief!"],
                [0, "It's Commander Riker's Birthday"],
                [3, "..."],
                [1, "Isn't he a scamp?"],
            ],
            [
                [0, "Chief!"],
                [3, "Yes sir"],
                [1, "Riker's blown his loa- leave, in the holodeck again"],
                [5, "..."],
                [2, "Be a dear and scrub the holo-filters"],
            ],
        ]
        self.images = [
            "cpt_order.png",
            "cpt_quiz.png",
            "cpt_silly.png",
            "ob_yes.png",
            "ob_what.png",
            "ob_gross.png",
        ]
        self.screens = []
        for i in self.images:
            p = os.path.join(root, "img", i)
            s = pg.image.load(p)
            self.screens.append(s)

    def show(self):
        pass
