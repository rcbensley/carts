width = 400
height = 240

briefs = {
	-- Holo
	{{1, "Chief!"}, {4, "Yes sir"}, {2, "Riker's blown his loa-leave, in the holodeck again"}, {6, "..."}, {3,"Be a dear and scrub the holo-filters"}}
}	


function mHolo()
end

function mBirthday()
end

function love.load()
bg = 0
screen = 0
briefIdx = 1
mission = 1
briefLen = #briefs[mission]
timer = 0

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

briefTexts = {
	"Chief!",
	"Miles!",
	"O'Brien!",
	"Sir?",
	"Yes, sir?",
	"Yes, dear?",
	"...",
	"What?",
}


briefImg = briefScreens[briefs[mission][briefIdx][1]]
briefText = briefs[mission][briefIdx][2]
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
				screen = 2
			end
			briefImg = briefScreens[briefs[mission][briefIdx][1]]
			briefText = briefs[mission][briefIdx][2]
			print(screen .. mission .. briefIdx)
		end
	end

	if screen == 2 then
		if timer >= 1 and love.keyboard.isDown("space") then
			print("game " .. mission .. " has ended")
			screen = 1
			timer = 0
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
		love.graphics.draw(briefImg, 0 , 0)
		love.graphics.print(briefText, 10, 200)
	end

	-- minigame
	if screen == 2 then
		love.graphics.draw(blank, 0, 0)
	end

end