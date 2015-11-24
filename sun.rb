class Sun
	def initialize
		@image = Gosu::Image.new("images/sun.png")
		@x = @y = @vel_x = @vel_y = @angle = 500
	end
	
	def draw
		@image.draw_rot(@x, @y, 1, @angle)
	end
end