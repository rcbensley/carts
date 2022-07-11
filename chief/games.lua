gameHolo = {
	gameOver = false,
	screens = {}
}
function gameHolo.load()
	gameHolo.screens = {
		love.graphics.newImage("img/ob_holo_hand.png"),
	}
end

function gameHolo.update(x, y, s)

end

function gameHolo.draw()
	love.graphics.draw(mHolo.screens[1])
end

gameBirthday = {
	gameOver = false,
	nod = 1,
	nods = 0,
}
function gameBirthday.load()
	gameBirthday.screens = {
		love.graphics.newImage("img/ob_nod1.png"),
		love.graphics.newImage("img/ob_nod2.png"),
	}
end

function gameBirthday.update(t, x, y, s)
	if gameBirthday.nods >= 8 then
		gameBirthday.gameOver = true
	end
	if t >= 0.5 and s then
		if y == 1
		then
			gameBirthday.nod = 1
			gameBirthday.nods = gameBirthday.nods + 1
			timer = 0
		end
		if y == -1
		then
			gameBirthday.nod = 2
			gameBirthday.nods = gameBirthday.nods + 1
			timer = 0
		end

	end
end

function gameBirthday.draw()
	love.graphics.draw(gameBirthday.screens[gameBirthday.nod])
end

Games = {
	gameHolo,
	gameBirthday,
}
