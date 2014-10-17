=begin
/*Struct were changed for entire class due they change their objects

	Player = Struct.new(:name, :location)
	Room = Struct.new(:reference, :name, :description, :connections)
=end
gretting = puts "Wellcome strainger do you have any name ?: "
puts "Yes my name is .. :"
@name = gets.chomp!.capitalize

while @name.length <= 0
	puts "What is your name strainger:"
	@name = gets.chomp!.capitalize
end

puts "So your name is #{@name} ? hu \n"




class Dungeon
	attr_accessor :player

	def initialize(player_name)
		@player = Player.new(player_name)
		@rooms = []
	end

	#This add a new Room  to @rooms array
	def add_room(reference, name, description, connections)
		@rooms << Room.new(reference, name, description, connections)
	end

	#This make the dungeon work
	def start(location)
		@player.location = location
		show_current_description
	end

	def show_current_description
		puts find_room_in_dungeon(@player.location).full_description
	end

	def find_room_in_dungeon(reference)
		@rooms.detect { |room| room.reference == reference }
	end

	def find_room_in_direction(direction)
		find_room_in_dungeon(@player.location).connections[direction]
	end

	def go(direction)
		puts "You go " + direction.to_s
		@player.location = find_room_in_direction(direction)
		show_current_description
	end

	class Player
		attr_accessor :name, :location

		def initialize(name)
			@name = name
		end
	end

	class Room
		attr_accessor :reference, :name, :description, :connections

		def initialize(reference, name, description, connections)
			@reference = reference
			@name = name
			@description = description
			@connections = connections
		end

		def full_description
			@name + "\n\nYou are in " + @description
		end
	end
end

=begin
	# Create the main dungeon object
	my_dungeon = Dungeon.new("Fred Bloggs")
	# Add rooms to the dungeon
	my_dungeon.add_room(:largecave, "Large Cave", "a large cavernous cave", { :west => :smallcave })
	my_dungeon.add_room(:smallcave, "Small Cave", "a small, claustrophobic cave", { :east => :largecave })

	# Start the dungeon by placing the player in the large cave
	my_dungeon.start(:largecave)
=end



