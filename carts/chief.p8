pico-8 cartridge // http://www.pico-8.com
version 38
__lua__
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
	palt(11,true)
end

function _update()

end

function _draw()
	
end

__gfx__
00000000bbbbb999bb99bbbbbbb00000000000bbbbbbbbfffffbbbbbb0004444444400bbbbbbbbbbbbbbbbbbbbbbb9999bb99bbbbb000bbbbbbbbbbbbbbfffbb
00000000bb99999999999bbbbb000000000000bbbbbbbfffffffbbbbb00004444444000bbbbbbbbbbbbbbbbbbbbb999999999bbbbb00000b0000bbbbbbffffbb
00700700b9999999999999bbb0000000fff00bbbbbbbfffffffffbbb000004444444000bbbbbbbbbbbbbbbbbbbbb999999999bbbbb00000000000bbb119ff911
00077000b9999ffffff999bbb000fffffffffbbbbbbffffffffffbbb000440444404400bbbbbbbbbbbbbbbbbbbb9999ffffffbbbbb00000ffffffbbb11f99ff1
00077000b999ffffffff9bbbb000ff777ff777bbbbb6f777f777f6bb000470040007400bbbbbbbbbbbbbbbbbbbb999f77ff77bbbbbb000077ff77bbb11fffff1
00700700b999777ff777fbbbb000ff770ff770bbbb66f707f707f66b000477000777400bbbbbbbb00bbbbbbbbbb999f70ff70bbbbbb000f70ff70bbb111fff1b
00000000b99f707ff707fbbbb0000f777ff777bbbb66f777f777f66b000470744707400bbbbbbbb0bbbbbbbbbbb99fffffffbbbbbbbb00ffffffbbbb1b51511b
00000000b999777ff777fbbbbb000fffffffffbbbb6fffffffffff6b0004444444444000bbbbbff00ffbbbbbbbb99ffffffffbbbbbbb00fffffffbbb1f151511
00000000b999fffffffffbbbbb000fffffffffbbbbfffffffffffffb0004444444444000bbbb777ff777bbbbbbb99ffffffffbbbbbbbb0fffffffbbbb15151bb
00000000b999fffffffffbbbbb000fffffffffbbbbfffffffffffffb000444444444400bbbbb770ff077bbbbbbb999ffff88fbbbbbbbbbffff88fbbbb515151b
00000000b999fffffffffbbbbb000fffff0000bbbbffffffffffffbb004444444444400bbbbf777ff777fbbbbbb999fff888fbbbbbbbbbfff888fbbbb111111b
00000000bb9fffffffffffbbbb0000ffff0ff0bbbbffffffffffffbb004444000004400bbbbffffffffffbbbbbb999fffffffbbbbbbbbbfffffffbbb1111111b
00000000bbbffff000ffffbbbbb0000ff00000bbbbbfff00000fffbb000044044444400bbbbffff00fffbbbbbb99999fffff9bbbbbbbbbbfffffbbbb1111111b
00000000bbbfffffffffffbbbbb00000f0fff0bbbbbffffffffffbbb000044444444400bbbbbffffffffbbbbbb99999ff99999bbbbbbbbbfffbbbbbb11111111
00000000bbbffffffffffbbbbbbb0000000f000bbbbbffffffffbbbbb00044444444400bbbbbbfffffbbbbbbbb99999ff99999bbbbbbbbbfffbbbbbb11111111
00000000bbbbffffffffbbbbbbbbb0000000000bbbbbbffffffbbbbbb000b44444444bbbbbbbbfffffbbbbbbbbbbbbfffbbbbbbbbbbbbbfffffbbbbb11111111
00000000000ff000000ff0000004400000044000000ff000000ff000000ff000000ff000000ff000000ff00000000000000000000000000000000000b15151bb
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000b515151b
00000000aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa8888888888888888ccccccccccccccccaaaaaaaaaaaaaaaa00000000000000000000000000000000b111111b
00000000a0aaaaaaaaaaaa0aa0aaaaaaaaaaaa0a8088888888888808c0cccccccccccc0cb0aaaaabbaaaaa0b00000000000000000000000000000000b1111111
00000000a0aaaaaaaaaaaa0aa0aaaaaaaaaaaa0a8088888888888808c0cccccccccccc0cb0aaaaabbaaaaa0b00000000000000000000000000000000b1111111
00000000a0aaaaaaaaaaaa0aa0aaaaaaaaaaaa0a8088888888888808c0cccccccccccc0cb0aaaaabbaaaaa0b00000000000000000000000000000000b1111111
00000000a0aaa0aaaaaaaa0aa0aaa0aaaaaaaa0a8088808888888808c0ccc0cccccccc0cb0aaa0abbaaaaa0b00000000000000000000000000000000b1111111
00000000f0aa00affaaaaa0f40aa00a44aaaaa04f088008ff888880ff0cc00cffccccc0fb0aa00abbaaaaa0b0000000000000000000000000000000011111111
00000000b000000bbb0000bbbb0000bbbb0000bb0004400000044000000440000004400000000000000000000000000000000000bb8877bbbbbbbbbbbbbbbbbb
00000000b000000bbb0000bbbb0000bbbb0000bb0000000000000000000000000000000000000000000000000000000000000000b778777bbbbbffbbbbbbbbbb
00000000b00bb00bbb000bbbbbb000bbbb0000bb8888888888888888cccccccccccccccc0000000000000000000000000000000077887777bbbffbbbbbbb095b
00000000b00bb00bbbb00bbbbbb000bbbb0bb0bb8088888888888808c0cccccccccccc0c0000000000000000000000000000000077877777ffffffbbbb666655
00000000b00bb00bbbb00bbbbb0000bbb00bb00b8088888888888808c0cccccccccccc0c0000000000000000000000000000000088877788ffffbbfbb6006bbb
00000000b00bb00bbbb00bbbb00000bbb00bb00b8088888888888808c0cccccccccccc0c0000000000000000000000000000000087777877bbbfbbfb600bbbbb
00000000b0bbbb0bbb000bbbb00b00bb00bbbb0b8088808888888808c0ccc0cccccccc0c00000000000000000000000000000000b777887bbbbbfbbb66bbbbbb
0000000000bbbb00bb0b00bbb0bbb00b0bbbbb00408800844888880440cc00c44ccccc0400000000000000000000000000000000bb7787bbbbbbbbbbbbbbbbbb