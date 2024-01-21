#!/usr/bin/env python3

import os


if __name__ == "__main__":
    found = {}
    files = os.listdir()
    for i in files:
        if i == "index.html":
            continue
        if i.endswith(".html"):
            found[i] = f'<li><a href="{i}">{i[:5]}</a></li>'

    links = ""
    for k in found:
        links = links + f"{found[k]}\n"

    t = f"""
<html>
<title>
Pico-8 Carts by Richard Bensley
</title>
<body>
<p>
Carts:
<ul>
{links}
</ul>
</p>
</body>
</html>
"""

    with open("index.html", "w") as f:
        f.writelines(t)
