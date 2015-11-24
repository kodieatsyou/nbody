require "gosu"

class Planet

	attr_accessor :x, :y, :x_vel, :y_vel, :x_acel, 
		:y_acel, :x_init_vel, :y_init_vel, :x_init, :y_init, :mass

	def initialize (x, y, x_vel, y_vel, mass, file_name,center,max)
		@x = x
		@y = y
		@x_init = x
		@y_init = y
		@x_vel = x_vel
		@y_vel = y_vel
		@x_init_vel = x_vel
		@y_init_vel = y_vel
		@mass = mass
		@file_name = file_name
		@center = center
		@max = max
		@x_acel = 0.0
		@y_acel = 0.0
	end

	def draw
		img = Gosu::Image.new("images/"+@file_name)
		x = @x*(400.0/@max)
		y = @y*(400.0/@max)
		img.draw(@center+x,@center+y,0)
	end
end