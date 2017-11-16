#Minefield Robot
#Kevin Lizander
#kevin9075@gmail.com
#reddit challenge: https://redd.it/7d4yoe

def help(input)
  #TODO doesn't output any of the options
  case input
  when"hr"
    return "The mines are represented by * and the robot by M.
            The orders understandable by the robot are as follows:

            N moves the robot one square to the north
            S moves the robot one square to the south
            E moves the robot one square to the east
            O moves the robot one square to the west
            I start the the engine of the robot
            - cuts the engine of the robot"
  when "hm"
    return "Your mine should have the following characteristics:
    Walls - described by the character +
    Bombs - described by the character *
    Safe roads - described by the character 0"
  else
    return "I do not understand this input."
  end
end

def get_input(string)
  if string.count == 1
    help(string.join("").chomp)
  else
    string.each_with_index do |line, index|
      $mine[index] = []
      $mine[index] << line.chars[0...-1]
    end
    return $mine.to_s
  end
end

def show_minefield
  $mine.each do |line|
    puts line.join("")
  end
end

def calculate_path(input)
  commands = input.chars
  robot_path = []
  commands.each do |action|
    case action.upcase!
    when "N"
      robot_path << [1, 0]
    when "S"
      robot_path << [-1, 0]
    when "E"
      robot_path << [0, -1]
    when "O"
      robot_path << [0, 1]
    when "-"
      break
    end
  end
  robot_row = $mine.find_index { |arr| arr.include?("M") }
  #TODO check nil error
  robot_col = $mine[robot_row].find_index { |arr| arr.include?("M") }
  robot_pos = [robot_row, robot_col]
  robot_path.each do |move|
    robot_pos[0] += move[0]
    robot_pos[1] += move[1]
    case $mine[robot_pos[0]][robot_pos[1]]
    when "+"
      puts "The robot hit a wall"
    when "*"
      puts "The robot hit a bomb"
    when "0"
      puts "The robot is safe"
    when " "
      puts "The robot is out"
    end
  end
end

def main
  puts "Your robot is ready to traverse any minefield. Please create one for him."
  $mine = []
  input = $stdin.readlines
  get_input(input)
  if $mine.any?
    puts "This is your minefield, now enter the commands for the robot's path."
    show_minefield
    input = gets.chomp
    calculate_path(input)
  else
    main
  end
end

main
