local game = {}

local button = require 'engine/button'

function game.load()

	local link_sound = love.audio.newSource("sounds/link.wav", 'static')

	game.buttons =
	{
		button.make_button(332, 62, 209, 158, function() link_sound:play() end)
	}

	game.linking_book_image = love.graphics.newImage("images/linking_book.png")
end

function game.update(delta_time)

end

function game.draw()
	love.graphics.draw(game.linking_book_image, 0, 0)

	for index, button in ipairs(game.buttons) do
		button:render()
	end
end

function game.mousepressed(x, y, button, is_touch)
	for index, button in ipairs(game.buttons) do
		if button:contains(x, y) then
			button:on_click()
		end
	end
end

function game.mousereleased(x, y, button, is_touch)

end

function game.keypressed(key)

end

function game.keyreleased(key)

end

function game.focus(focus)

end

function game.quit()

end

return game