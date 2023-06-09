local game = require 'game'

function love.load()
	game.load()
end

function love.update(delta_time)
	game.update(delta_time)
end

function love.draw()
	game.draw()
end

function love.mousepressed(x, y, button, is_touch)
	game.mousepressed(x, y, button, is_touch)
end

function love.mousereleased(x, y, button, is_touch)
	game.mousereleased(x, y, button, is_touch)
end

function love.keypressed(key)
	game.keypressed(key)
end

function love.keyreleased(key)
	game.keyreleased(key)
end

function love.focus(focus)
	game.focus(focus)
end

function love.quit()
	game.quit()
end