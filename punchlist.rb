class Punchy
	# Punchy runs the command line stuff, triggers projects and tasks classes
	#   Project		Gungho-Guides folder containing 
	#     |_Feature		features.md headings are features, paragraphs under are descriptions of tasks
	#     | |_Tasks		Ordered list of tasks pertaining to each feature
	#     |
	#     |_Bugs		bugs.md headings are bugs, paragraphs under are descriptions of tasks
	#       |_tasks		Ordered list of tasks pertaining to each bug

	# Creates basic method and instance vars
	attr_accessor :command, :dirs, :curDir

	def initialize
		@command = ""	
		@@dirs = Array.new 
		@@curDir = Dir.pwd
	end

	# Lists all the directories in the current path not starting with a "."
	def dir_listing
		Dir.glob('*') do |f|#go through all the files in the directory that don't start with a "."
				if File.directory?(f)#if file is a directory, then it's a project
					if @@dirs.size == 0
						@@dirs[0] = nil
					end
					@@dirs[@@dirs.size] = f#add the file to the directory arrray
					puts "[#{@@dirs.size - 1}] - #{f}"#display the directory and the number associated to it
				end
		end
	end

	#the menu to be looped through
	def display_menu
		puts ""
		puts "You are currently in #{@@curDir}"
		puts "Enter the number next to the project file to open that project, :q to quit"
		puts ""
	end

	#handle what the user inputed
	def input
		@command = gets.to_s.strip #must strip to get rid of \n when user hits enter
		commandI = @command.to_i #convert input to integer to see what number they pressed
		if commandI < (@@dirs.size) && commandI > 0 #many strings will convert to integer 0, therefore we cannot use 0 as a number to be used
			puts "You selected #{@@dirs[commandI]}"
			self.open_dir(@@dirs[commandI])
		elsif @command == ":q"
			return #quit command entered
		elsif
			puts "Invalid selection. Try again"
		end
	end

	#open the directory the user entered
	def open_dir(dir_path)
		Dir.chdir(@@curDir + "/#{dir_path}") #enter directory selected by user
		@@curDir = Dir.pwd #update current directory
		
		project = Project.new
		project.home_screen

		#we return back to here when project class returns by calling return in the input function
		@@dirs = Array.new
		Dir.chdir('..')
		@@curDir = Dir.pwd
	end
	
	#the main controller for punchy
	def home_screen 
		while @command != ":q"
			self.display_menu

			self.dir_listing
			
			self.input

			@@dirs = Array.new
		end
	end
end

class Project < Punchy
	
	#reset the listing of dirs, command is an instance variable not a class variable because it should not be shared
	def initialize
		@@dirs = Array.new
		@command = ""
	end

	#slightly different menu layout for when inside a project folder
	def display_menu
		puts ""
		puts "You are currently in #{@@curDir}"
		puts "Enter the number next to the category, :q to back to your punchlist"
		puts ""
	end

end

punchy = Punchy.new
punchy.home_screen
