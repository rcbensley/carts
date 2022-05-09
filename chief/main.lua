function love.load()
	width = 400
	height = 240

	missions = {
		mHolo,
		mBirthday,
	}

	title = love.graphics.newImage("img/title1.png")
	blank = love.graphics.newImage("img/game.png")

	briefScreens = {
		love.graphics.newImage("img/cpt_order.png"),
		love.graphics.newImage("img/cpt_quiz.png"),
		love.graphics.newImage("img/cpt_silly.png"),
		love.graphics.newImage("img/ob_yes.png"),
		love.graphics.newImage("img/ob_what.png"),
		love.graphics.newImage("img/ob_gross.png"),
	}

	gameScreens = {
		love.graphics.newImage("img/ob_holo_hand.png"),
		love.graphics.newImage("img/ob_nod1.png"),
		love.graphics.newImage("img/ob_nod2.png"),
	}

	bg = 0
	screen = 0
	briefIdx = 1
	mission = 1
	timer = 0
end

-- START OF MISSIONS

mHolo = {
	text = { { 1, "Chief!" }, { 4, "Yes sir" }, { 2, "Riker's blown his loa- leave, in the holodeck again" }, { 6, "..." }, { 3, "Be a dear and scrub the holo-filters" } },
	game_over = false,
}

function mHolo:update()
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
	--self.game_over = love.keyboard.isDown("space")
end

function mHolo:draw()
	love.graphics.draw(gameScreens[1])
end

mBirthday = {
	text = { { 1, "Chief!" }, { 1, "It's Commander Riker's Birthday" }, { 4, "..." }, { 2, "Isn't he a scamp?" } },
	gameOver = false,
	screen = 2,
	nods = 0,
}

function mBirthday:update()
	if love.keyboard.isDown("space") then
		if self.screen == 2 then
			self.screen = 3
		elseif self.screen == 3 then
			self.screen = 2
		end
		self.nods = self.nods + 1
		if self.nods >= 8 then
			self.gameOver = true
		end
	end
end

function mBirthday:draw()
	love.graphics.draw(gameScreens[self.screen])
end

-- END OF MISSIONS

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
				minigame = true
				screen = 2
			end
		end
	end

	if screen == 2 then
		if not missions[mission].game_over then
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
		love.graphics.draw(briefScreens[missions[mission].text[briefIdx][1]], 0, 0)
		love.graphics.print(missions[mission].text[briefIdx][2], 10, 200)
	end

	-- minigame
	if screen == 2 then
		if not missions[mission].game_over then
			missions[mission].draw()
		end
	end

end
