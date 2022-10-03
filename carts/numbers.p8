pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
-- dopamine grind
level = 0
maxlevel= 10
stats = {}
stats["level"] = level
stats["wit"] = rnd(20)
stats["suave"] = rnd(20)
stats["balls"] = rnd(20)
stats["midichlorians"] = rnd(20)
stats["cholesterol"] = rnd(20)

for k,v in pairs(stats) do
	print(k, v)
end

function randtblstr(s)
	i = flr(rnd(#s))
	while(i <= 0) do
		i = flr(rnd(#s))
	end
	return s[i]
end


function concatname(a, b, sep)
	a = randtblstr(a)
	b = randtblstr(b)
	d = a .. sep .. b
	return d
end

towns_a = {
	"doo",	"dun",	"big",	"stink",
	"small",	"last",	"dill",	"hole",
	"fluff"
}
 
towns_b = {
	"shire",	"ton",
	"town",	"ham",
	"ville", "dool"
}

names_a = {
	"dort",	"ed",
	"jort",	"hert",
	"saman",	"putur",
	"dorf", "lurz",
	"fumpf", "turb"
}

names_b = {
	"d'wurd",	"the savoury",
	"shurt",	"ert", "o'ur",
	"hunghurk", "m'lert",
	"loe'arp", "surt", "unholy"
}

town = concatname(towns_a, towns_b, "")
name = concatname(names_a, names_b, " ")
fullname = name .. " of " .. town

print(fullname)

grndmsgs = {
	"", "", "",
}

endgamemsgs = {
}

function grndmsg()
	l = randtblstr(grndmsgs)
	return l
end
