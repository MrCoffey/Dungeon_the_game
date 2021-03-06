=begin
/*Struct were changed for entire class due they change their objects

	Player = Struct.new(:name, :location)
	Room = Struct.new(:reference, :name, :description, :connections)
=end

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

	class Gretting

		def game_init
			gretting = puts "Elf: Wellcome strainger do you have any name ?\n"
			puts "Yes my name is .. :"
			@name = gets.chomp!.capitalize

			while @name.length <= 0
				puts "Elf: What is your name strainger:\n"
				@name = gets.chomp!.capitalize
			end


			puts "\nElf: So your name is #{@name} uuhh!, dude! do have any idea of where on earth are you?, this isn't a place for racional people, best if you run away...\n "

			early_choise = false
			while early_choise == false
				puts "What you wanna do ?\n"

				puts "1. Leave"
				puts "2. Keep on"

				option = gets.chomp.to_i

				if option == 1
					puts "You: OMG! i didn't notice, see ya! faggot"
					puts "Game Over"
					early_choise = true
					exit
				elsif option == 2
					puts "You: Shut up, and get out of my way!"
					early_choise = true
				end
			end
			puts "Elf: Well done strainger!, it's time to chose your class\n"
		end
	end	

	class Player
		attr_accessor :name, :location

		def initialize(name)
			@name = name
		end

		def type_player
			player_class_choise = false

			while player_class_choise == false
				puts "#{@name}, you must chose a class !"

				puts "1. Warrior"
				puts "2. Wizzard"		
				puts "3. Dwarf"

				warrior_choise = gets.chomp.to_i

				case warrior_choise
					when 1
						puts "You are a Human, class warrior"
						player_class_choise = true
					when 2
						puts "You are an Elf, class wizzard"
						player_class_choise = true
					when 3
						puts "You are a Dwarf, class support"
						player_class_choise = true
					else	
						"unknown"						
				end	
			end
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
#Dialog when game just start
gretting = Dungeon::Gretting.new
gretting.game_init

#Player Chose their class *pls check dialog that clash
new_player = Dungeon::Player.new("#{@name}")
puts new_player.type_player

# Create the main dungeon object
my_dungeon = Dungeon.new("#{@name}")
# Add rooms to the dungeon
my_dungeon.add_room(:largecave, "Large Cave", "a large cavernous cave", { :west => :smallcave })
my_dungeon.add_room(:smallcave, "Small Cave", "a small, claustrophobic cave", { :east => :largecave })
# Start the dungeon by placing the player in the large cave
my_dungeon.start(:largecave)
