local button = {}

local function contains(self, x, y)
	return
		not
		(
			(x < self.x) or
			(x > (self.x + self.width)) or
			(y < self.y) or
			(y > (self.y + self.height))
		)
end

function button.make_button(x, y, width, height, on_click, render)

	if x == nil then x = 0 end
	if y == nil then y = 0 end

	if width == nil then width = 1 end
	if height == nil then height = 1 end

	if on_click == nil then on_click = function() end end
	if render == nil then render = function() end end

	return
	{
		x = x,
		y = y,
		width = width,
		height = height,
		render = render,
		contains = contains,
		on_click = on_click,
	}
end

local function render_image(self)
	love.graphics.draw(self.image, self.x, self.y, self.width, self.height)
end

function button.make_image_button(x, y, width, height, on_click, image)
	local result = button.make_button(x, y, width, height, on_click, render_image, image)

	result.image = image

	return result
end

local function render_solid(self)
	love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end

function button.make_solid_button(x, y, width, height, on_click, red, green, blue, alpha)
	if red == nil then red = 1.0 end
	if green == nil then green = 1.0 end
	if blue == nil then blue = 1.0 end
	if alpha == nil then alpha = 1.0 end

	local result = button.make_button(x, y, width, height, on_click, render_solid)

	result.red = red
	result.green = green
	result.blue = blue
	result.alpha = alpha

	return result
end

local function render_text(self)
	love.graphics.print(self.text, self.x, self.y)
end

function button.make_text_button(x, y, width, height, text, on_click)
	local result = button.make_button(x, y, width, height, on_click, render_text)

	result.text = text

	return result
end

return button