Brief = { i = 1 }
function Brief.load()
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
		{ { 1, "Chief!" }, { 4, "Yes sir" }, { 2, "Riker's blown his loa- leave, in the holodeck again" }, { 6, "..." },
			{ 3, "Be a dear and scrub the holo-filters" } },
	}
end

function Brief.update(s)

	if timer >= 0.5 and s then
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

function Brief.draw()
	love.graphics.draw(briefs.screens[briefs.b[mission][briefs.i][1]])
	love.graphics.print(briefs.b[mission][briefs.i][2], 10, 200)
end
