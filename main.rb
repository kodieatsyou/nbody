require "gosu"
require_relative "planet"

class Window < Gosu::Window

	def initialize
		super 800, 800
		self.caption = "N-Body Simulator"
		
		f = File.open("simulations/planets.txt", "r")
		data = []
		f.each_line {|i| data.push(i)}
		@planets = []
		for i in 2..data.length-1
			info = data[i].split(" ")
			@planets.push(Planet.new(info[0].to_f,info[1].to_f,info[2].to_f,
				info[3].to_f,info[4].to_f,info[5],400,data[1].to_f))
		end
		f.close

		@bg = Gosu::Image.new("images/space.jpg")
		@time = 0
	end

	def update
		deltaTime = 10000.0

		@planets.each do |p|
			g = 6.674*10**-11

			xForceTotal = 0
			yForceTotal = 0

			@planets.each do |other|
				if other != p
					dx = p.x - other.x
					dy = p.y - other.y

					r = Math.sqrt((dx**2)+(dy**2))
					f = (g*p.mass*other.mass)/(r**2)

					xf = f*(dx/r)
					yf = f*(dy/r)
					xForceTotal -= xf
					yForceTotal -= yf
				end
			end

			p.x_acel = xForceTotal/p.mass
			p.y_acel = yForceTotal/p.mass

			p.x_vel += p.x_acel*deltaTime
			p.y_vel += p.y_acel*deltaTime

			p.x += p.x_vel*deltaTime
			p.y += p.y_vel*deltaTime
		end
		@time += deltaTime
	end

	def draw
		@bg.draw(0,0,0)
		@planets.each {|i| i.draw}
	end
end

window = Window.new
window.show