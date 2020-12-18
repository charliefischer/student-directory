@students = []

def students_push
  @students << {name: @name, cohort: @cohort.to_sym}
end

def get_input
  STDIN.gets.chop.to_sym.capitalize
end

def input_students
  puts "To finish, hit enter with no name present"
  loop do
    puts "Please enter the name of the student"
    @name = get_input
    if @name.empty?
      break
    end
    puts "Please enter their cohort start date"
    @cohort = get_input
    if @cohort.empty?
      @cohort = "N/A"
    end
    puts "Is this data correct?"
    puts "(name: #{@name}) (cohort: #{@cohort})"
    yes_or_no = get_input
    if yes_or_no == :Yes
      students_push
      puts "Now we have #{@students.count} students"
    end
  end
end

def print_header
puts "The students of Villains Academy".center(40)
puts "----------".center(40)
end

def print_footer
  if @students.count == 1
    puts "Overall we have 1 student"
  elsif @students.count > 1
    puts "Overall, we have #{@students.count} great students".center(40)
  end
end

def print_menu
#1. print the menu and ask the user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "9. Exit"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(40)
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def save_students
  filename = gets.chomp
  File.open(filename, "w") do |line|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      line.puts csv_line
    end
  end
end



def load_students(filename = gets.chomp)
  File.open(filename,"r").readlines.each do |line|
      @name, @cohort = line.chomp.split(',')
      students_push
  end
  

end

def try_load_students
  filename = ARGV.first #first argument from the command line
  if filename.nil?
    filename = students.csv
    load_students
  elsif File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else #if it doesn't exist
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end


def interactive_menu
  loop do
    print_menu
#2. read the input and save it into a variable
    selection = STDIN.gets.chomp
#3. do what the user has asked
    case selection
    when "1"
    puts "You've selected 'Input the students'"
      input_students
    when "2"
    puts "You've selected 'Show the students'"
      show_students
    when "3"
    puts "You've selected 'Save the list to a file'"
    puts "What file would you like to save to?"
      save_students
    when "4"
    puts "You've selected 'Load the list from a file'"
    puts "What file would you like to load?"
      load_students
    when "9"
      puts "Goodbye"
      exit #this will terminate the program
    else
      puts "I don't know what you meant, try again"
    end
  end
end


#nothing happens until we call the methods
#try_load_students
interactive_menu












#let's put all the students into an array
# students = [
#   {name: "Dr. Hannibal Lecter", cohort: :november},
#   {name: "Darth Vader", cohort: :november},
#   {name: "Nurse Ratched", cohort: :november},
#   {name: "Michael Corleone", cohort: :november},
#   {name: "Alex DeLarge", cohort: :november},
#   {name: "The Wicked Witch of the West", cohort: :november},
#   {name: "Terminator", cohort: :november},
#   {name: "Freddy Krueger", cohort: :november},
#   {name: "The Joker", cohort: :november},
#   {name: "Joffrey Baratheon", cohort: :november},
#   {name: "Norman Bates", cohort: :november}
# ]

# def printer
#   puts "Which cohort would you like to view?"
#   month = gets.chomp.to_sym.capitalize
#   puts "Students from the #{month} cohort".center(40)
#   puts "-----------".center(40)
#   @students.map { |student|
#     if student[:cohort] == month
#     puts "#{student[:name]}".center(40)
#   end
# }
# end

# def print(names)
#   names.each_with_index do |student, index|
#     puts " #{index}. #{student[:name]} (#{student[:cohort]} cohort)"
#   end
# end

# def print(names)
#   names.each do |student|
#   puts "#{student[:name]} (#{student[:cohort]} cohort)"
#   end
# end

# def print(names)
#   names.each do |student|
#     if student[:name].chars.first == "A"
#       puts "#{student[:name]} (#{student[:cohort]} cohort)"
#     end
#   end
# end

# def print(names)
#   names.each do |student|
#     if student[:name].length < 12
#       puts "#{student[:name]} (#{student[:cohort]} cohort)"
#     end
#   end
# end

# def printer(names)
#   i = 0
#   until i == names.length
#     puts ("#{names[i][:name]} (#{names[i][:cohort]} cohort)").center(40)
#     i += 1
#   end
# end

#def load_students
#  file = File.open(filename, "r")
#  file.readlines.each do |line|
#  @name, @cohort = line.chomp.split(',')
#  students_push
#  end
#  file.close

#def save_students
#  filename = gets.chomp
#  file = File.open(filename, "w")
#
#  @students.each do |student|
#    student_data = [student[:name], student[:cohort]]
#    csv_line = student_data.join(",")
#    file.puts csv_line
#  end
#  file.close
#end
