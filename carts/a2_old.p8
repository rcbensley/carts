pico-8 cartridge // http://www.pico-8.com
version 33
__lua__
function fc(t,u)
	for x=1,u do
		add(t,{rnd(128),rnd(128)})
	end
end

function fd(t,c)
	for i in all(t) do
		pset(i[1],i[2],c)
	end
end

function updatefill(t)
	for i in all(t) do
		i[1] -= 1
	end
end

function _init()
	pa={}
	pb={}
	fc(pa,12000)
	fc(pb,8000)
	pac={256,64,164,10}
	pbc={256,64,160,9}
	pcc={256,64,156,0}

	t = 40
	b = 47
	g = {
	--i
	{{62,t,62,b},{63,t,63,b}},
	--a left
	{{18,t,14,b},{17,t,13,b}},
	--n middle
	{{112,t,116,b},{113,t,117,b}},
	--l left
	{{37,t,37,b},{38,t,38,b}},
	--e left
	{{86,t,86,b},{87,t,87,b}},
	--a right
	{{18,t,22,b},{19,t,23,b}},
	--n right
	{{116,t,116,b},{117,t,117,b}},
	--e top and bottom
	{{88,t,91,t},{88,41,91,41},{88,b,91,b},{88,46,91,46}},
	--l bottom
	{{39,46,41,46},{39,47,41,47}},
	--n left
	{{112,t,112,b},{113,t,113,b}},
	--e middle
	{{88,43,90,43},{88,44,90,44}},
	--a middle
	{{17,44,19,44},{16,45,20,45}}
	}

	s = 0
	f = 0
	x = 1
	c = 1
	u = 120
	a = 5
	cols = {1,13}
end

function dline(t, c)
	line(t[1],t[2],t[3],t[4],c)
end

function daline(t, c)
	for j in all(t) do
		dline(j, c)
	end
end

function intro()
	circfill(pac[1],pac[2],pac[3],pac[4])
	fd(pa,0)
	circfill(pbc[1],pbc[2],pbc[3],pbc[4])
	fd(pb,0)
	circfill(pcc[1],pcc[2],pcc[3],pcc[4])
	for i=1,x do
		if i > #g then
			goto continue
		end
		if i < x then
			dc = 7
		else
		--7,6,13,1
			if f <= 60 then
				goto continue
			end
			if f > u-(a) then
				dc = 6
			elseif f > u-(a*2) then
				dc = 13
				elseif f > u-(a*3) then
				dc = 1
			else
				goto continue
			end	
		end
		daline(g[i], dc)
		::continue::
	end
end

function _update() 
			f += 1	
			if f >= u then
				f = 0
				if x <= #g then
					x += 1
				end
			end
			if f % 5 == 0 then
				pac[1] -= 1
				pbc[1] -= 1
				pcc[1] -= 1
			end
end

function _draw()
	cls()
	intro()
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
