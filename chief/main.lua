screen = 0
width = 400
height = 240
winCount = 0
loseCount = 0
bg = 0

briefs = {
	-- Holo
	{{1, "Chief!"}, {4, "Yes sir"}, {1, "Riker's blown all his loa-leave, in the holodeck again"}, {6, " "}, {2,"Be a dear and scrub the holo-filters"}}
}	

briefIdx = 1
briefLen = 1
mission = 0
missionLen = # briefs

function mHolo()
end

function mBirthday()
end

function love.load()
title = love.graphics.newImage("img/title1.png")
blank = love.graphics.newImage("img/game.png")

briefImg = {
	love.graphics.newImage("img/cpt_order.png"),
	love.graphics.newImage("img/cpt_quiz.png"),
	love.graphics.newImage("img/cpt_silly.png"),
	love.graphics.newImage("img/ob_yes.png"),
	love.graphics.newImage("img/ob_what.png"),
	love.graphics.newImage("img/ob_gross.png"),
}
end

function nextMission()
	mission = mission + 1
	if mission > missionLen then
		mission = 1
	end
	briefLen = #briefs[mission]
	briefIdx = 0
end

function love.update(dt)
	if screen == 2 then
		-- mini game controls
		print("game " .. mission)
		screen = 1
		return
	end

	if love.keyboard.isDown("space") then
		if screen == 0 then
			screen = 1
			nextMission()
			return
		end
		if screen == 1 then
			if briefIdx <= 0 then
				briefIdx = 1
			elseif briefIdx <= briefLen then
				briefIdx = briefIdx + 1
			elseif briefIdx > briefLen then
				-- Brief finished, reset
				nextMission()
				-- play minigame
				-- screen = 2
			end
			return
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
		local i = briefs[mission][briefIdx][1]
		love.graphics.draw(briefImg[i], 0 , 0)
		love.graphics.print(briefs[mission][briefIdx][2], 10, 200)
	end

	if screen == 2 then
	-- minigame
		love.graphics.draw(blank, 0, 0)
	end

end