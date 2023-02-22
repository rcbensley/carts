from ursina import *


class ClassicTankController(Entity):
    def __init__(self, **kwargs):
        super().__init__()

        self.key_forward = "w"
        self.key_backward = "s"
        self.key_turn_left = "a"
        self.key_turn_right = "d"

        # Parse kwargs for handling things like key bindings.
        for k, v in kwargs.items():
            setattr(self, k, v)

    def update(self):
        self.direction = Vec3(self.forward * (held_keys("w") - held_keys("s")))

    def input(self):
        return

    def use(self):
        return
