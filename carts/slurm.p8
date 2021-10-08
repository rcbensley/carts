pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
score=0
slurms=10	
player = {}

function _init()
	player_make()
end

function _update()
	player_move()
end

function _draw()
	cls()
	map(0,0,0,0,128,64)
	player_draw()
end

function player_move()
	if (btn(0)) then
		player.x-=1
		player.flip=false
		player.sprite+=1
		if player.sprite > 52 then
			player.sprite = 51
		end
	end
	if (btn(1)) then
		player.x+=1
		player.flip=true
		player.sprite+=1
		if player.sprite > 52 then
			player.sprite = 51
		end
	end
	if (btn(2)) then
			for i=1,3 do
				player.y-=1
			end
			for i=1,3 do
				player.y+=1
			end	
	end
	if (btn(3)) then
		player.y+=1
	end
end

function player_make()
	player.x=64
	player.y=64
	-- velocity?
	player.dx=0
	player.dy=0
	player.w=1
	player.h=1
	player.sprite=51
	player.flip=false
end

function player_draw()
	spr(player.sprite,
		player.x,
		player.y,
		player.w,
		player.h,
		player.flip)
end
__gfx__
00000000002222000022220000222200000000000000000000000000000000000000000000000000000000000000000000000000000000000090000000099000
00000000077ff220077ff220077ff220000000000000000000000000000000000000000000000000000000000000000000000000000000000900000000999900
007007007077f2207077f2207077f220000000000000000000000000000000000000000000000000000000000000000000000000000000000999999009999990
000770007777f2207777f2207777f220000000000000000000000000000000000000000000000000000000000000000000000000000000000f17179009999990
00077000077ff022077ff022077ff02200000000000000000000000000000000000000000000000000000000000000000000000000000000ffffff900f999ff0
007007000fff7020ffff7f20ffff7f20000000000000000000000000000000000000000000000000000000000000000000000000000000000ffff80908888880
00000000f7777f000777700007777000000000000000000000000000000000000000000000000000000000000000000000000000000000000877788008888c80
000000000010100000101000001010000000000000000000000000000000000000000000000000000000000000000000000000000000000000c00c0000c00c00
00000000000ff000000ff000000ff000000000000000000000000000000000000000000000000000000000000000000000000000000000000090000000099000
0000000000ffff00075f7500075f7500000000000000000000000000000000000000000000000000000000000000000000000000000000000900000000999900
00000000075f75f07665665076656650000000000000000000000000000000000000000000000000000000000000000000000000000000000999999009999990
0000000076656650065f65f0065f65f0000000000000000000000000000000000000000000000000000000000000000000000000000000000f17179009999990
00000000065f65f00ffffff00ffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffff990ff999f0
000000000fff77700fff77700fff7770000000000000000000000000000000000000000000000000000000000000000000000000000000000ffff80008888880
00000000006677000066770000667700000000000000000000000000000000000000000000000000000000000000000000000000000000000877788008c88880
0000000000d0d00000d0d00000d0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000cc00000c00c00
00000000000060000000600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000066666000666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000670705606070756000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000677775606777756000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000066666600666666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000a0a06000a0a060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000066666000666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000006006000060060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000009000000090000000900000009000000000000000000000000000000000000000000000000000000000000000000000000440000056660000566600
00000000090000000900000009000000090000000000000000000000000000000000000000000000000000000000000000000000000420000539ab600539ab60
00000000099999900999999009999990099999900000000000000000000000000000000000000000000000000000000000000000000420000393bab00393bab0
000000000f1717900f1717900f1717900f17179000000000000000000000000000000000000000000000000000000000000000000053b2000339bbb00339bbb0
00000000ffffff90ffffff90ffffff90ffffff990000000000000000000000000000000000000000000000000000000000000000003aab000333abb00333abb0
000000000ffff8090ffff8090ffff8090ffff80000000000000000000000000000000000000000000000000000000000000000000099aa000393bab00393bab0
00000000087778800877788008777880087778800000000000000000000000000000000000000000000000000000000000000000005334000339abb00339abb0
0000000000c00c0000c00c0000c00c00000cc0000000000000000000000000000000000000000000000000000000000000000000005444000055660000556600
c8821222222221222221288c11111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c8821222222221222221288c11111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c8811111111111111111188c11111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c8822222221222222222288c11111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88222222221222222222228811111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88111111111111111111118811111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88221222222221222221228811111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88221222222221222221228811111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88221222222221222221228800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88221222222221222221228800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88111111111111111111118800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88222222221222222222228800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88222222221222222222228800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88111111111111111111118800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88221222222221222221228800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88221222222221222221228800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d666666d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
45555545000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
44455444000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
44444444000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
04444040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
04040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
cccccccc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
cccccccc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
cccccccc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
cccccccc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
cccccccc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
cccccccc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
cccccccc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
cccccccc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000100000000000000000000000000010001000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
5043434343434343434343434343435200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5043434343434343434343434343435200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5043434343434343434343434343435200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5043434343434343434343434343435200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5043434343434343434343434343435200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5043436060604343434343434343435200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5043434343434343434343434343435200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5043434343434343434343434343435200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5043434343434343434343434343435200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5043434343434343434343434343435200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5043434343434343434343434343435200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5043434343434343434343434343435200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5043434343434343434343434343435200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5043434343434343434343434343435200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5043434343434343434343434343435200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5060606060606060606060606060605200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
