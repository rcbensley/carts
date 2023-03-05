AZ = "abcdefghijklmnopqrstuvwxyz"
OFFSETS = list([i for i in range(-4, 4)])
GAMES = list()


def randaz():
    game = list()
    for o in OFFSETS:
        for i in range(0, 25):
            j = i + o
            if j < 0:
                diff = 0 - j
                j = 25 - diff
            elif j >= 25:
                diff = j - 25
                j = 0 + diff
            game.append(j)
    GAMES.append(game)


if __name__ == "__main__":
    randaz()
    for i in GAMES:
        a = list()
        for j in i:
            a.append(AZ[j])

        s = "".join(a)
        print(f"{a}\n")
