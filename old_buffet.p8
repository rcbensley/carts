pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
function _init()
	x = 64
	y = 64
	r = 16
	c = 2*3.14*r
	
	upper = c/2
	lower = upper-c
	ox = 0
	oy = 0
	rx = 64
	ry = 64
	offx=0
	offy=0
	mx = 0
	my = 0
end

function _update()
	if (btn(0)) then
		x=x-1
		ox=ox-1
		offx=-1
		offy=0
	end
	if (btn(1)) then
		x=x+1
		ox=ox+1
		offx=1
		offy=0
	end
	if (btn(2)) then
		y=y-1
		oy=oy-1
		offx=0
		offy=-1
	end
	if (btn(3)) then
		y=y+1
		oy=oy+1
		offx=0
		offy=1
	end
	
	if x >= 70 then x=70 end
	if x <= 58 then x=58 end
	if y >= 70 then y=70 end
	if y <= 58 then y=58 end
	
	if oy > upper then
		oy=lower
	elseif oy < lower then
		oy=upper
	end
	if ox > upper then
	ox=lower
	elseif ox < lower then
		ox=upper
	end

	rx=x+ox
	ry=y+oy
	
end

function draweye()
	circfill(x, y, r, 3)
	circfill(rx+offx, ry+offy, 8, 8)
	circfill(rx, ry, 8, 7)
	circfill(rx, ry, 4, 0)
end

function drawmask()
	local ly=y-r
	for lx=x-r,x+r do
		local c=lx-(x-r)
		c=c/(r*2)
		c=c*2-1
		c=1-sqrt(1-c*c)
		
		local h=c*r+0.2

		line(lx,0,lx,ly+h,1)
		line(lx,ly+r*2-h,lx,128, 1)
	end
	--pre r
	for lx=0,x-r-1 do
		line(lx,0,lx,128, 1)
	end
	-- post r+1
	for lx=x+r+1,128 do
		line(lx,0,lx,128, 1)
	end
end

function _draw()
	cls()
	draweye()
 drawmask()
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
