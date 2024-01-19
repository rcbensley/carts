pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
-- levels
--
-- holodeck, hand item game
-- transporter room, golf like bar
-- ten forward, chase game
-- bridge, just gtfo, you are dismissed, get me a tea
-- 

lives = 3
score = 0
screen = 0
title = "chief"

m={
	{"riker has blown his lo-leave in the holodeck again", "", "be a dear and scrub the holo-filters"},
	{"mr. worf has passed out drunk at the vulcan embassy", "again, sir?", "beam him aboard"},
	{"wesley has scraped his knee", "", "make his boo boo better"},
	{"i need you to stop troy's mother from pincher officers bottoms"},
}

function _init()
	seconds=0
	t=0
	counter=1
	palt(11,true)
	palt(0,false)
end

function _update()
	t+=1
	if t % 30 == 0 then
		seconds += 1
	end
	if t % 10 == 0 then
		counter += 1
	end
	if t>=120 then
		t=0
	end
end

function draw_talk(x,y,t)
	if counter > #m then
		counter=1
	end
	local m={53,54,55,56,57}
	spr(m[counter],x+4,y+8)
end

function draw_eyes(x,y,t)
	local xe=x+5
	local ye=y+5
	if counter!=1 then
	rectfill(xe,ye,xe+2,ye+2,7)
	rectfill(xe+5,ye,xe+7,ye+2,7)
	pset(xe+1,ye+1,1)
	pset(xe+6,ye+1,1)
	end
end

function draw_face(x,y,f,t)
	local face={f,f+1,f+16,f+17}
	spr(face[1],x,y)
	spr(face[2],x+8,y)
	spr(face[3],x,y+8)
	spr(face[4],x+8,y+8)
	draw_talk(x,y,t)
	draw_eyes(x,y,t)
end


function _draw()
	cls()

	draw_face(32,32,1,t)
	--spr(65,32+4,32+10)
end
__gfx__
00000000bbbbb999bb99bbbbbbb00000000000bbbbbbbbfffffbbbbbb0004444444400bbbbbbbbbbbbbbbbbbbbbbb9999bb99bbbbb000bbbbbbbbbbbbbbfffbb
00000000bb99999999999bbbbb000000000000bbbbbbbfffffffbbbbb00004444444000bbbbbbbbbbbbbbbbbbbbb999999999bbbbb00000b0000bbbbbbffffbb
00700700b9999999999999bbb0000000fff00bbbbbbbfffffffffbbb000004444444000bbbbbbbbbbbbbbbbbbbbb999999999bbbbb00000000000bbb119ff911
00077000b9999ffffff999bbb000fffffffffbbbbbbffffffffffbbb000440444404400bbbbbbbbbbbbbbbbbbbb9999ffffffbbbbb00000ffffffbbb11f99ff1
00077000b999ffffffff9bbbb000ff777ff777bbbbb6f777f777f6bb000470040007400bbbbbbbbbbbbbbbbbbbb999f77ff77bbbbbb000077ff77bbb11fffff1
00700700b999fffffffffbbbb000ff770ff770bbbb66f707f707f66b000477000777400bbbbbbbb00bbbbbbbbbb999f70ff70bbbbbb000f70ff70bbb111fff1b
00000000b99ffffffffffbbbb0000f777ff777bbbb66f777f777f66b000470744707400bbbbbbbb0bbbbbbbbbbb99fffffffbbbbbbbb00ffffffbbbb1b51511b
00000000b999fffffffffbbbbb000fffffffffbbbb6fffffffffff6b0004444444444000bbbbbff00ffbbbbbbbb99ffffffffbbbbbbb00fffffffbbb1f151511
00000000b999fffffffffbbbbb000fffffffffbbbbfffffffffffffb0004444444444000bbbb777ff777bbbbbbb99ffffffffbbbbbbbb0fffffffbbbb15151bb
00000000b999fffffffffbbbbb000fffffffffbbbbfffffffffffffb000444444444400bbbbb770ff077bbbbbbb999ffff88fbbbbbbbbbffff88fbbbb515151b
00000000b999fffffffffbbbbb000fffff0000bbbbffffffffffffbb004444444444400bbbbf777ff777fbbbbbb999fff888fbbbbbbbbbfff888fbbbb111111b
00000000bb9fffffffffffbbbb0000ffff0ff0bbbbffffffffffffbb004444444444400bbbbffffffffffbbbbbb999fffffffbbbbbbbbbfffffffbbb1111111b
00000000bbbfffffffffffbbbbb0000ff0fff0bbbbbfffffffffffbb000044444444400bbbbffff00fffbbbbbb99999fffff9bbbbbbbbbbfffffbbbb1111111b
00000000bbbfffffffffffbbbbb00000f0fff0bbbbbffffffffffbbb000044444444400bbbbbffffffffbbbbbb99999ff99999bbbbbbbbbfffbbbbbb11111111
00000000bbbffffffffffbbbbbbb0000000f000bbbbbffffffffbbbbb00044444444400bbbbbbfffffbbbbbbbb99999ff99999bbbbbbbbbfffbbbbbb11111111
00000000bbbbffffffffbbbbbbbbb0000000000bbbbbbffffffbbbbbb000b44444444bbbbbbbbfffffbbbbbbbbbbbbfffbbbbbbbbbbbbbfffffbbbbb11111111
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000aaaaaaaaaaaaaaaa8888888888888888ccccccccccccccccaaaaaaaaaaaaaaaa00000000000000000000000000000000000000000000000000000000
00000000a0aaaaaaaaaaaa0a8088888888888808c0cccccccccccc0cb0aaaaabbaaaaa0b00000000000000000000000000000000000000000000000000000000
00000000a0aaaaaaaaaaaa0a8088888888888808c0cccccccccccc0cb0aaaaabbaaaaa0b00000000000000000000000000000000000000000000000000000000
00000000a0aaaaaaaaaaaa0a8088888888888808c0cccccccccccc0cb0aaaaabbaaaaa0b00000000000000000000000000000000000000000000000000000000
00000000a0aaa0aaaaaaaa0a8088808888888808c0ccc0cccccccc0cb0aaa0abbaaaaa0b00000000000000000000000000000000000000000000000000000000
00000000b0aa00abbaaaaa0bb088008bb888880bb0cc00cbbccccc0bb0aa00abbaaaaa0b00000000000000000000000000000000000000000000000000000000
00000000b000000bbb0000bbbb0000bbbb0000bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbccccccbbb8877bbbbbbbbbbbbbbbbbb
00000000b000000bbb0000bbbb0000bbbb0000bbbbbbbbbbbbb70bbbbbbbbbbb07707707bbbbbbbbbbbbbbbbbbbbbbb0bbc11cbbb778777bbbbbffbbbbbbbbbb
00000000b00bb00bbb000bbbbb0000bbbbb000bbbb000bbbbb7707bbb000000b07707707bbbbbbbbbbbbbbbb0bbbbbb0bcc11ccb77887777bbbffbbbbbbb095b
00000000b00bb00bbbb00bbbbb0bb0bbbbb000bbbb0000bbbb0000bb0000000000000000b00000bbbbbbbbbb00bb0000cc1117cc77877777ffffffbbbb666655
00000000b00bb00bbbb00bbbb00bb00bbb0000bbbb0000bbb000000b00000000b000000b0770770b00000000bb000eeec111117c88877788ffffbbfbb6006bbb
00000000b00bb00bbbb00bbbb00bb00bb00000bbbbb00bbbb000000b00bbb000bbb000bb0bbbbb00bbbbbbbbbbbb8eeecd11111c87777877bbbfbbfb600bbbbb
00000000b0bbbb0bbb000bbb00bbbb0bb00b00bbbbbbbbbbb000000bbbbbbbbbbbbb0bbbbbbbbbbbbbbbbbbbbbbb8eeeccddd1ccb777887bbbbbfbbb66bbbbbb
0000000000bbbb00bb0b00bb0bbbbb00b0bbb00bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb8eebccccccbbb7787bbbbbbbbbbbbbbbbbb
00000000000000000000000000000000009009000000000011111111111111111111111100000000000000000000000000000000000000000000000000000000
00000000000000000000000000000999999999999990000011111111111111111111111100000000000000000000000000000000000000000000000000000000
00000000000000000000000000009000009009000009000011111111111111111111111100000000000000000000000000000000000000000000000000000000
000aaaaaaaaaaaaaccccc00000090000009009000000900011111151515115151511111100000000000000000000000000000000000000000000000000000000
00aaaaaaaaaaaaaacccccc0000900099999999999900090011115555555555555555111100000000000000000000000000000000000000000000000000000000
0aaaaa000000000000ccccc009000900009009000090009011115222222222222225111100000000000000000000000000000000000000000000000000000000
aaaaa00000000000000ccccc09009000999999990009009011155244444444444425511100000000000000000000000000000000000000000000000000000000
aaaaa00000000000000ccccc09090009009000909000909011115249999999999425111100000000000000000000000000000000000000000000000000000000
aaaaa00009000090000ccccc09090090009000900900909011155249499999949425511100000000000000000000000000000000000000000000000000000000
aaaaa00090000009000ccccc99090090009000900900909911115249999999999425111100000000000000000000000000000000000000000000000000000000
aaaaa00090000009000ccccc09999999999999999999999011155249999999999425511100000000000000000000000000000000000000000000000000000000
aaaaa00090000009000ccccc09090090009000900900909011115249999999999425111100000000000000000000000000000000000000000000000000000000
aaaaa00090000009000ccccc09090090009000900900909011115249999999999425111100000000000000000000000000000000000000000000000000000000
aaaaa00090000009000ccccc09999999999999999999999011155249999999999425511100000000000000000000000000000000000000000000000000000000
aaaaa00090000009000ccccc99090090009000900900909911115249999999999425111100000000000000000000000000000000000000000000000000000000
aaaaa00009000090000ccccc09090090009000900900909011155249499999949425511100000000000000000000000000000000000000000000000000000000
aaaaa00000000000000ccccc00000000000000000000000011115249999999999425111100000000000000000000000000000000000000000000000000000000
aaaaa00000000000000ccccc00000000000000000000000011155244444444444425511100000000000000000000000000000000000000000000000000000000
0aaaaa000000000000ccccc000000000000000000000000011115222222222222225111100000000000000000000000000000000000000000000000000000000
00aaaaaacccccccccccccc0000000000000000000000000011115555555555555555111100000000000000000000000000000000000000000000000000000000
000aaaaaccccccccccccc00000000000000000000000000011111555555555555551111100000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000011111155555555555511111100000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000011111115555555555111111100000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000011111111111111111111111100000000000000000000000000000000000000000000000000000000
