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


if __name__ == "__main__":
    g = randaz()
    for i in g:
        a = list()
        for j in i:
            a.append(AZ[j])

        s = "".join(a)
        print(s)
