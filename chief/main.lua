
width = 400
height = 240
winCount = 0
loseCount = 0
bg = 0

missions = {
	mHolo,
	mBirthday,
}


function mHolo()

end

function mBirthday()

end

function drawTitle()

end


function love.load()

title = love.graphics.newImage("img/title1.png")

imgCpt = {
	love.graphics.newImage("img/cpt_order.png"),
	love.graphics.newImage("img/cpt_quiz.png"),
	love.graphics.newImage("img/cpt_silly.png"),
}

imgOb = {
	love.graphics.newImage("img/ob_yes.png"),
	love.graphics.newImage("img/ob_what.png"),
	love.graphics.newImage("img/ob_gross.png"),
}

end

function drawBg()
end

function drawTitle()
	love.graphics.draw(title, 0, 0)
end

function drawImg(t, k)
	love.graphics.draw(t[k], 0, 0)
end

function love.update(dt)

end

function love.draw()
	love.graphics.setBackgroundColor(bg, bg, bg)
	drawImg(imgCpt, 1)
	drawTitle()

end