pico-8 cartridge // http://www.pico-8.com
version 39
__lua__
function _init()
	
end


function draw_back()
	cls(1)
	--rectfill(0,71,128,32,13)
	for i=0,127 do
		local mb=71+sin(i/(128/1))*20
		local mt=71+sin((i+1)/(128/1)*20)
		line(i,mb,i+1,mt,13)
	end
	rectfill(0,72,128,128,7)
end

function draw_grass()
	for i=0,127,2 do
		line(i,71,i,64,7)
	end

end


function _draw()
	draw_back()
	draw_grass()
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000