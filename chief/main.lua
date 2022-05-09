width = 400
height = 240

briefs = {
	-- Holo
	{ { 1, "Chief!" }, { 4, "Yes sir" }, { 2, "Riker's blown his loa-leave, in the holodeck again" }, { 6, "..." }, { 3, "Be a dear and scrub the holo-filters" } },
	-- Birthday
	{{1, "Chief!"} ,{1, "It's Commander Riker's Birthday"}, {4, "..."}, {2, "Isn't he a scamp?"}},
}




function love.load()
	minigame = false
	rx = 0.0
	ry = 0.0
	x = 0.0
	y = 0.0
	state = {}


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
	missionCount = #briefs
	briefLen = #briefs[mission]
	timer = 0
	briefImg = briefScreens[briefs[mission][briefIdx][1]]
	briefText = briefs[mission][briefIdx][2]
end

function game_holo()
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
	minigame = false
end

function draw_game_holo()
	love.graphics.draw(gameScreens[1])
end

function game_birthday()
	if #state == 0 then
		state["img"] = 2
		state["nods"] = 0
	end
	if love.keyboard.isDown("space") then
		if state["img"] == 3 then
			state["img"] = 2
		else
			state["img"] = 3
		end
		state["nods"] = state["nods"] + 1
	end
	if state["nods"] >= 7 then
		minigame = false
	end
end

function draw_game_birthday()
	love.graphics.draw(gameScreens[state["img"]])
end

briefGames = {
	{game_holo, draw_game_holo},
	{game_birthday, draw_game_birthday}
}

function nextMission()
	if mission >= missionCount then
		mission = 1
	else
		mission = mission + 1
	end
	minigame = false
	screen = 1
	timer = 0
	state = {}
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
			if briefIdx <= 0 then
				briefIdx = 1
			elseif briefIdx <= briefLen then
				briefIdx = briefIdx + 1
			end

			if briefIdx > briefLen then
				briefLen = #briefs[mission]
				briefIdx = 1
				minigame = true
				screen = 2
			end
			briefImg = briefScreens[briefs[mission][briefIdx][1]]
			briefText = briefs[mission][briefIdx][2]
		end
	end

	if screen == 2 then
		if minigame then
			briefGames[1][mission]()
			return
		end
		if timer >= 1 and love.keyboard.isDown("space") then
			print("game " .. mission .. " has ended")
			nextMission()
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
		love.graphics.draw(briefImg, 0, 0)
		love.graphics.print(briefText, 10, 200)
	end

	-- minigame
	if screen == 2 then
		if minigame then
			briefGames[2][mission]()
			return
		else
			love.graphics.draw(blank, 0, 0)
		end
	end

end
