require("brief")
require("games")

Title = {}
function Title.load()
	Title.screen = love.graphics.newImage("img/title1.png")
end

function Title.update(s)
	if timer >= 0.5 and s then
		timer = 0
		showTitle = false
		showBrief = true
	end
end

function Title.draw()
	love.graphics.setBackgroundColor(bg, bg, bg)
	love.graphics.draw(Title.screen, 0, 0)
end

function love.load()
	bg = 0
	timer = 0
	X = 0
	Y = 0
	SPACE = false
	titleScreen = true
	briefScreen = false
	gameScreen = false

	game = 1
	Games = {}
	Title.load()
	Brief.load()
	for i = 1, #Games do
		Games[i].load()
	end
end

function love.update(dt)
	timer = timer + dt
	if love.keyboard.isDown("space") then
		SPACE = true
	end
	if love.keyboard.isDown("a", "left") then
		X = -1
	end
	if love.keyboard.isDown("d", "right") then
		X = 1
	end
	if love.keyboard.isDown("w", "up") then
		Y = 1
	end
	if love.keyboard.isDown("s", "down") then
		Y = -1
	end
	if titleScreen then Title.update(SPACE) return end
	if briefScreen then Brief.update(SPACE) return end
	if gameScreen then Games[game].update(X, Y, SPACE) return end

end

function love.draw()
	if titleScreen then Title.draw() return end
	if briefScreen then Brief.draw() return end
	if gameScreen then Games[game].draw() return end
end