@students = []

def input_students
  puts "To finish, hit enter with no name present"
  loop do
    puts "Please enter the name of the student"
    name = gets.chop.to_sym.capitalize
    if name.empty?
      break
    end
    puts "Please enter their cohort start date"
    cohort = gets.chop.to_sym.capitalize
    if cohort.empty?
      cohort = "N/A"
    end
    puts "Is this data correct?"
    puts "(name: #{name}) (cohort: #{cohort})"
    yes_or_no = gets.chop
    if yes_or_no.downcase == "yes"
      @students << {name: name, cohort: cohort}
      puts "Now we have #{@students.count} students"
    end
  end
end

def print_header
puts "The students of Villains Academy".center(40)
puts "----------".center(40)
end




def print_footer
  if @students.count < 2
    puts "Overall we have 1 student"
  elsif @students.count > 1
    puts "Overall, we have #{@students.count} great students".center(40)
  end
end

def print_menu
#1. print the menu and ask the user what to do
  puts "1. Input the students"
  puts "2. Show the students"
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

def interactive_menu
  loop do
    print_menu
#2. read the input and save it into a variable
    selection = gets.chomp
#3. do what the user has asked
    case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      puts "Goodbye"
      exit #this will terminate the program
    else
      puts "I don't know what you meant, try again"
    end
  end
end
#nothing happens until we call the methods
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
