screen = 0
width = 400
height = 240
winCount = 0
loseCount = 0
bg = 0

midx = 1
mission = 1

function mHolo()
end

function mBirthday()
end

function love.load()

title = love.graphics.newImage("img/title1.png")

briefImg = {
	love.graphics.newImage("img/cpt_order.png"),
	love.graphics.newImage("img/cpt_quiz.png"),
	love.graphics.newImage("img/cpt_silly.png"),
	love.graphics.newImage("img/ob_yes.png"),
	love.graphics.newImage("img/ob_what.png"),
	love.graphics.newImage("img/ob_gross.png"),
}

briefs = {
	-- {{imgCptX, imgObX, imgCptX, imgObX, imgCptX}, {cptAsk, obConf, cptScene, obReact, cptOrder}}
	-- Holo
	{{1, 4, 1, 6, 2},{"Chief!", "Yes sir", "Riker's blown all his loa-leave, in the holodeck again", "", "Be a dear and scrub the holo-filters."} }
}	
end

function drawBrief(m,i)
	love.graphics.draw(briefs[m][i], 0 , 0)
	love.graphics.print(briefs[m][i], 10, 200)
end

function nextMission()
	mission = mission + 1
end

function love.update(dt)
	if love.keyboard.isDown("space") then
		if screen == 0 then
			screen = 1
			return
		end
		if screen >= 1 then
			midx = midx + 1
			if midx >= #briefs[m][1] then
				nextMission()
			end
			return
		end
	end

end

function love.draw()
	love.graphics.setBackgroundColor(bg, bg, bg)
	if screen == 0 then
		love.graphics.draw(title, 0, 0)
	end

	if screen >= 1
		drawbrief(mission,midx)
	end

end