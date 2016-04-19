require 'restaurant'
class Guide
	class Config
		@@actions = ['list', 'find', 'add', 'quit']
		def self.actions; @@actions; end
	end

	def initialize (path=nil)
		# locate the restaurant text file at path
		Restaurant.filepath = path
		if Restaurant.file_usable?
			puts "Found restaurant file."
		# or create a new file
		elsif Restaurant.create_file
			puts "Created restaurant file."
		# exit if create fails
		else
			puts "Existing.\n\n"
			exit!
		end
	end

	def launch!
		introduction
		# action loop
		#   what do you want to do? (list, find, add, quit)
		result = nil
		until result == :quit
			action = get_action
			result = do_action(action)
		end	
		conclusion
	end 

	def get_action
		action = nil
		until Guide::Config.actions.include?(action)
			print "> "
			user_response = gets.chomp
			action = user_response.downcase.strip
		end
		return action
	end

	def do_action(action)
		case action
		when 'list' 
			puts "Listin..."
		when 'find'
			puts 'Finding...'
		when 'add'
			add
		when 'quit'
			return :quit
		else
			puts "\nI don't understand that command"
		end
	end

	def add
		puts "\nAdd a restaurant\n\n".upcase
		restaurant = Restaurant.build_using_questions
		if restaurant.save
			puts "\nRestaurant Added\n\n"
		else
			puts "\nSave Error: Restaurant not added"
		end
	end

	def introduction
		puts "\n\n<<< Welcome to the Food Finder>>>\n\n"
		puts "This is an interactive guide to local restaurants.\n\n"
	end

	def conclusion
		puts "\n<<< Goodbye, Thanks for checking us out >>>\n\n\n"
	end

end
