-- START OF MISSIONS

mHolo = {
	gameOver = false,
	screens = {}
}

function mHolo.load()
	mHolo.screens = {
		love.graphics.newImage("img/ob_holo_hand.png"),
	}
end

function mHolo.update()
	if love.keyboard.isDown("a", "left") then
		rx = -1.0
	end
	if love.keyboard.isDown("d", "right") then
		rx = 1.0
	end
	if love.keyboard.isDown("w", "up") then
		ry = -1.0
	end
	if love.keyboard.isDown("s", "down") then
		ry = 1.0
	end
	mHolo.gameOver = love.keyboard.isDown("space")
end

function mHolo.draw()
	love.graphics.draw(mHolo.screens[1])
end

mBirthday = {
	gameOver = false,
	nod = 1,
	nods = 0,
}

function mBirthday.load()
	mBirthday.screens = {
		love.graphics.newImage("img/ob_nod1.png"),
		love.graphics.newImage("img/ob_nod2.png"),
	}
end

function mBirthday.update(dt)
	if love.keyboard.isDown("space") then
		if mBirthday.nod == 1 then
			mBirthday.nod = 2
		else
			mBirthday.nod = 1
		end
		mBirthday.nods = mBirthday.nods + 1
		if mBirthday.nods >= 8 then
			mBirthday.gameOver = true
		end
	end
end

function mBirthday.draw()
	love.graphics.draw(mBirthday.screens[mBirthday.nod])
end

-- END OF MISSIONS

briefs = {
	i = 1
}
function briefs.load()
	briefs.screens = {
		love.graphics.newImage("img/cpt_order.png"),
		love.graphics.newImage("img/cpt_quiz.png"),
		love.graphics.newImage("img/cpt_silly.png"),
		love.graphics.newImage("img/ob_yes.png"),
		love.graphics.newImage("img/ob_what.png"),
		love.graphics.newImage("img/ob_gross.png"),
	}
	briefs.b = {
		{ { 1, "Chief!" }, { 1, "It's Commander Riker's Birthday" }, { 4, "..." }, { 2, "Isn't he a scamp?" } },
		{ { 1, "Chief!" }, { 4, "Yes sir" }, { 2, "Riker's blown his loa- leave, in the holodeck again" }, { 6, "..." }, { 3, "Be a dear and scrub the holo-filters" } },
	}
end

function briefs.update(dt)
	timer = timer + dt

	if timer >= 0.5 and love.keyboard.isDown("space") then
		timer = 0
		if briefs.i <= #briefs.b[mission] then
			briefs.i = briefs.i + 1
		else
			showBrief = false
			showGame = true
			briefs.i = 1
		end

	end

end

function briefs.draw()
	love.graphics.draw(briefs.screens[briefs.b[mission][briefs.i][1]])
	love.graphics.print(briefs.b[mission][briefs.i][2], 10, 200)
end

title = {}
function title.load()
	title.screen = love.graphics.newImage("img/title1.png")
end

function title.update(dt)
	time = timer + dt
	if timer >= 0.5 and love.keyboard.isDown("space") then
		timer = 0
		showTitle = false
		showBrief = true
	end
end

function title.draw()
	love.graphics.setBackgroundColor(bg, bg, bg)
	love.graphics.draw(title.screen, 0, 0)
end

function love.load()
	bg = 0
	brief = 1
	mission = 1
	timer = 0

	showTitle = true
	showBrief = false
	showGame = false

	missions = {
		mHolo,
		mBirthday,
	}

	title.load()
	briefs.load()
	for i = 1, #missions do
		missions[i].load()
	end
end

function love.update(dt)
	print(showTitle, showBrief, showGame)
	if showTitle then
		title.update(dt)
		return
	end
	if showBrief then
		briefs.update(dt)
		return
	end

	if showGame then
		mission[mission].update(dt)
		return
	end
end

function love.draw()
	if showTitle then
		title.draw()
		return
	end

	if showBrief then
		briefs.draw()
		return
	end

	if showGame then
		missions[mission].draw()
	end
end
