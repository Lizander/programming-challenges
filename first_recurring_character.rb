#First Recurring Character
#Kevin Lizander
#kevin9075@gmail.com
#reddit challenge:https://redd.it/7cnqtw

puts "Welcome to the First Recurring Character program, please input any string
and I'll tell you which character is the first to be repeated."

@string = gets.chomp

@chars = @string.chars
@not_found = false
@letter_position = []

@chars.each_with_index do |c, i|
  if @chars.count(c) > 1
    @letter_position << [@chars.rindex(c), c]
  end
end

if @letter_position.empty?
  puts "I couldn't find any recurring characters."
else
  @letter_position.sort!
  puts "The first recurring character is " + @letter_position[0][1] +
  " which is character number " + @letter_position[0][0].to_s + " in the string."
end
