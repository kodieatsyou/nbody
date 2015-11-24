class Planets
	Gravity = 6.67408e-11
	attr_accessor :x, :y, :xvel, :yvel, :xscal, :yscal, :weight,:force, :name, :acceleration, :xforce, :yforce, :xacceleration, :yacceleration
	def initialize(x, y, xvel, yvel, weight, image, r)
		@image = Gosu::Image.new("images/#{image}")
		@x = x
		@y = y
		@force = 0
		@xforce= 0
		@yforce = 0
		@xacceleration = 0
		@yacceleration = 0
		@name = image
		@xscal = 0
		@yscal = 0
		@xvel = xvel
		@yvel = yvel
		@weight = weight
		@r = r
	end
	
	def draw
		@image.draw(@xscal - @image.width / 2.0, @yscal - @image.height / 2.0 , 1)
	end

	 def force(planets)
		xdist = @x - planets.x
	 	ydist = @y - planets.y
	 	dist = Math.sqrt((xdist**2) + (ydist**2))
	 	@force = ((Gravity*@weight*planets.weight)/(dist**2))
	 	@xforce -= (@force * xdist) / dist
		@yforce -= (@force * ydist) /dist
	end

	def acceleration
	 	 @xacceleration =  (@xforce / @weight)
	 	 @yacceleration = (@yforce / @weight)
	 	 @xforce = 0
	 	 @yforce = 0
	 end

	 def speed
	 	 @xvel = (@xvel + 15000 * @xacceleration)
		 @yvel = (@yvel + 15000 * @yacceleration)
	 end

	def location
	 	@x += @xvel * 15000
	 	@y += @yvel * 15000
	 	@xscal = (@x / (@r * 2)) + 375
		@yscal = (-@y / (@r * 2)) + 375
	end
end