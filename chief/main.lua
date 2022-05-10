-- START OF MISSIONS

mHolo = {
	text = { { 1, "Chief!" }, { 4, "Yes sir" }, { 2, "Riker's blown his loa- leave, in the holodeck again" }, { 6, "..." }, { 3, "Be a dear and scrub the holo-filters" } },
	game_over = false,
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
	mHolo.game_over = love.keyboard.isDown("space")
end

function mHolo.draw()
	love.graphics.draw(mHolo.screens[1])
end

mBirthday = {
	text = { { 1, "Chief!" }, { 1, "It's Commander Riker's Birthday" }, { 4, "..." }, { 2, "Isn't he a scamp?" } },
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

function mBirthday.update()
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

function love.load()
	width = 400
	height = 240

	title = love.graphics.newImage("img/title1.png")
	blank = love.graphics.newImage("img/game.png")

	briefs = {
		love.graphics.newImage("img/cpt_order.png"),
		love.graphics.newImage("img/cpt_quiz.png"),
		love.graphics.newImage("img/cpt_silly.png"),
		love.graphics.newImage("img/ob_yes.png"),
		love.graphics.newImage("img/ob_what.png"),
		love.graphics.newImage("img/ob_gross.png"),
	}

	bg = 0
	screen = 0
	briefIdx = 1
	mission = 1
	timer = 0

	missions = {
		mHolo,
		mBirthday,
	}

	for i = 1, #missions do
		missions[i].load()
	end
end

function love.update(dt)
	timer = timer + dt

	if screen == 0 then
		if timer >= 0.5 and love.keyboard.isDown("space") then
			timer = 0
			screen = 1
		end
	end

	if screen == 1 then
		if timer >= 0.5 and love.keyboard.isDown("space") then
			timer = 0
			if briefIdx < #missions[mission].text then
				briefIdx = briefIdx + 1
			elseif briefIdx >= #missions[mission].text then
				briefIdx = 1
				screen = 2
			end
		end
	end

	if screen == 2 then
		if timer >= 0.5 and not missions[mission].game_over then
			timer = 0
			missions[mission].update()
		end
		if timer >= 1 and love.keyboard.isDown("space") then
			if mission >= #missions then
				mission = 1
			else
				mission = mission + 1
			end
			screen = 1
		end
	end

end

function love.draw()
	love.graphics.setBackgroundColor(bg, bg, bg)
	-- Title screen
	if screen == 0 then
		love.graphics.draw(title, 0, 0)
	end

	-- Draw current brief
	if screen == 1 then
		love.graphics.draw(briefs[missions[mission].text[briefIdx][1]], 0, 0)
		love.graphics.print(missions[mission].text[briefIdx][2], 10, 200)
	end

	-- minigame
	if screen == 2 then
		if not missions[mission].game_over then
			missions[mission].draw()
		end
	end

end
