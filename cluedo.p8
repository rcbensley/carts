pico-8 cartridge // http://www.pico-8.com
version 27
__lua__
names = {
 'miss. scarlett',
	'colonel mustard',
 'mrs. white',
 'reverend green',
 'mrs. peacock',
 'professor plum',
 'candlestick',
 'dagger',
 'lead pipe',
 'revolver',
 'rope',
 'spanner',
 'ballroom',
 'billiard room',
 'conservatory',
 'dining room',
 'hall',
 'kitchen',
 'library',
 'lounge',
	'study',
}

function name(i)
	local n=names[i]
	return n
end

-- set deck, answer, shuffle.
cards={}
for i=1,21 do
	add(cards, i)
end

answer={
	flr(rnd(6))+1,
	flr(rnd(6))+7,
	flr(rnd(6))+13}

for i=1,3 do
	del(cards, answer[i])
end

function shuffle(t)
  -- do a fisher-yates shuffle
  for i = #t, 1, -1 do
    local j = flr(rnd(i)) + 1
    t[i], t[j] = t[j], t[i]
  end
end

shuffle(cards)

	
-- set players
players={}
a=1
for i=1,6 do
	local p={}
	local h={}
	p.name=names[i]
	p.seen={}
	local b=i*3
	for j=a,b do
		add(h, cards[j])
	end
	a=a+3
	p.hand = h
	p.seen = h
	add(players, p)
end

function debug()
	for a in all(answer) do
		print(name(a))
	end
	for p in all(players) do
		print(#players[p].name)
		print(#players[p].hand)
--	foreach(players[i].hand, print)
	end
end

function ask()

end

function show()

end

function suggest()

end

debug()
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0007700000088000000aa000000bb000000cc0000002200000077000000000000000000000000000000000000000000000000000000000000000000000000000
0007700000088000000aa000000bb000000cc0000002200000077000000000000000000000000000000000000000000000000000000000000000000000000000
0070070000088000000aa000000bb000000cc0000002200000077000000000000000000000000000000000000000000000000000000000000000000000000000
000000000088880000aaaa0000bbbb0000cccc000022220000777700000000000000000000000000000000000000000000000000000000000000000000000000
00000000088888800aaaaaa00bbbbbb00cccccc00222222007777770000000000000000000000000000000000000000000000000000000000000000000000000
00000000444444444444444444444444444444444444444444444444000000000000000000000000000000000000000000000000000000000000000000000000
00000000499999999999999999999994499999999999999999999994000000000000000000000000000000000000000000000000000000000000000000000000
00000000499999999999999999999994499999999999999999999994000000000000000000000000000000000000000000000000000000000000000000000000
00000000499999999999999999999994499999999999999999999994000000000000000000000000000000000000000000000000000000000000000000000000
00000000499999999999999999999994499999999999999999999994000000000000000000000000000000000000000000000000000000000000000000000000
00000000499999999999999999999994499999999999999999999994000000000000000000000000000000000000000000000000000000000000000000000000
00000000499999999999999999999994499999999999999999999994000000000000000000000000000000000000000000000000000000000000000000000000
00000000499999999999999999999994499999999999999999999994000000000000000000000000000000000000000000000000000000000000000000000000
00000000499999999999999999999994499999999999999999999994000000000000000000000000000000000000000000000000000000000000000000000000
00000000499999999999999999999994499999999999999999999994000000000000000000000000000000000000000000000000000000000000000000000000
00000000499999999999999999999994499999999999999999999994000000000000000000000000000000000000000000000000000000000000000000000000
00000000499999999999999999999994499999999999999999999994000000000000000000000000000000000000000000000000000000000000000000000000
00000000499999999999999999999994499999999999999999999994000000000000000000000000000000000000000000000000000000000000000000000000
00000000499999999999999999999994499999999999999999999994000000000000000000000000000000000000000000000000000000000000000000000000
00000000499999999999999999999994499999999999999999999994000000000000000000000000000000000000000000000000000000000000000000000000
00000000499999999999999999999994499999999999999999999994000000000000000000000000000000000000000000000000000000000000000000000000
00000000499999999999999999999994499999999999999999999994000000000000000000000000000000000000000000000000000000000000000000000000
00000000499999999999999999999994499999999999999999999994000000000000000000000000000000000000000000000000000000000000000000000000
00000000499999999999999999999994499999999999999999999994000000000000000000000000000000000000000000000000000000000000000000000000
00000000499999999999999999999994499999999999999999999994000000000000000000000000000000000000000000000000000000000000000000000000
00000000499999999999999999999994499999999999999999999994000000000000000000000000000000000000000000000000000000000000000000000000
00000000499999999999999999999994499999999999999999999994000000000000000000000000000000000000000000000000000000000000000000000000
00000000499999999999999999999994499999999999999999999994000000000000000000000000000000000000000000000000000000000000000000000000
00000000444444444444444444444444444444444444444444444444000000000000000000000000000000000000000000000000000000000000000000000000