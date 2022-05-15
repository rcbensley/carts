pico-8 cartridge // http://www.pico-8.com
version 36
__lua__
function _init()
	ex = 64
	ey = 64
	ox = 0
	oy = 0
	rx = 64
	ry = 64
end

function _update()
	if (btn(0)) then
		ex=ex-1
		ox=ox-1
	end
	if (btn(1)) then
		ex=ex+1
		ox=ox+1
	end
	if (btn(2)) then
		ey=ey-1
		oy=oy-1
	end
	if (btn(3)) then
		ey=ey+1
		oy=oy+1
	end
	if oy > 50 then
		oy = -50
	elseif oy < -50 then
		oy = 50
	end
	if ox > 50 then
	ox = -50
	elseif ox < -50 then
		ox = 50
	end
	rx = ex + ox
	ry = ey + oy
end

function draweye()
	circfill(ex, ey, 16, 3)
--	circ(ex, ey+1, 8, 8)
	oval(rx-12, ry-4, rx+12, ry+5, 8)
--	circfill(ex, ey, 8, 7)
	ovalfill(rx-12, ry-4, rx+12, ry+4, 7)
	circfill(rx, ry, 4, 0)
end

function _draw()
	cls()
	draweye()
end
__gfx__
000000000aaaaaa00aaaaaa00000000000000000000ff0f00f0ff000000000000000000000000000000000000000000000000000000000000000000000000000
000000001aaaaaa11aaaaaa100aaaaa00aaaaa00000ff030030ff000000000000000000000000000000000000000000000000000000000000000000000000000
000000001aaaaaa11aaaaaa10accacc00ccacca00333333003333330000000000000000000000000000000000000000000000000000000000000000000000000
000000000aaaaaa00aaaaaa00accacc00ccacca00303300000033030000000000000000000000000000000000000000000000000000000000000000000000000
000000000acccca00cccccc0aaaaaaaaaaaaaaaa0f033000000330f0000000000000000000000000000000000000000000000000000000000000000000000000
000000001cccccc11cccccc1aaaaaaaaaaaaaaaa0001100000011000000000000000000000000000000000000000000000000000000000000000000000000000
00000000199999911aaaaaa1aaaaaaaaaaaaaaaa0001200000021000000000000000000000000000000000000000000000000000000000000000000000000000
00000000099999900999999001100110011001100002000000002000000000000000000000000000000000000000000000000000000000000000000000000000
