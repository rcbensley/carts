#!/usr/bin/env python3

import pygame

AZ = "abcdefghijklmnopqrstuvwxyz"
OFFSETS = list([i for i in range(-4, 4)])


def randaz():
    games = list()
    for o in OFFSETS:
        game = list()
        for i in range(0, 25):
            j = i + o
            if j < 0:
                diff = 0 - j
                j = 25 - diff
            elif j >= 25:
                diff = j - 25
                j = 0 + diff
            game.append(j)
        games.append(game)
    return games


def gen_randaz():
    g = randaz()
    for i in g:
        a = list()
        for j in i:
            a.append(AZ[j])

        s = "".join(a)
        print(s)


def main():
    screen_x = 128
    screen_y = 160
    pygame.init()
    pygame.display.set_caption("Radio")
    screen = pygame.display.set_mode((screen_x, screen_y))
    clock = pygame.time.Clock()

    bg = pygame.Surface(screen.get_size())
    bg = bg.convert()
    bg.fill((0, 0, 0))

    running = True
    while running:
        clock.tick(60)

        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                running = False

        screen.blit(bg, (0, 0))
        pygame.display.flip()

    pygame.quit()


if __name__ == "__main__":
    main()
