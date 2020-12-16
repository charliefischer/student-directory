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
def input_students
  puts "To finish, hit enter with no name present"
  puts "If you make a typo, enter 'typo'"
  #create an empty array
  students = []
  loop do
    puts "Please enter the name of the student"
    name = gets.chomp.to_sym
    if name.empty?
      break
    end
    puts "Please enter their cohort start date"
    cohort = gets.chomp.to_sym
    if cohort.empty?
      cohort = "N/A"
    end

    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
  end
  students
end

# def typo
#   if country = "typo" || hobbies = "typo" || cohort = "typo" || name ="typo"
#     puts "sucker"
#   end
# #end

def print_header
puts "The students of Villains Academy"
puts "----------"
end

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

def printer(names)
  i = 0
  until i == names.length
    puts ("#{names[i][:name]} (#{names[i][:cohort]} cohort)").center(40)
    i += 1
  end
end

def print_footer(names)
puts "Overall, we have #{names.count} great students"
end
#nothing happens until we call the methods
students = input_students
print_header
printer(students)
print_footer(students)
