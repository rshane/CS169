def palindrome?(str)
  pal = str.downcase.gsub(/[^\w]/i,'').reverse
  str = str.downcase.gsub(/[^\w]/i,'')
  str == pal
end

def count_words(str)
  wrds = {}
  str = str.downcase.gsub(/[^\w]/i,' ')
  arr = str.scan(/\w+/)
  arr.each do|wrd|
    if wrds[wrd]
      wrds[wrd] += 1
    else
      wrds[wrd] = 1
    end
  end
  return wrds
end

=begin
#TEST

cat = "kitty"
puts "false: #{palindrome?(cat)}"

cat = "KITt579i**.k  777"
puts "false: #{palindrome? cat}"

cat = ""
puts "true: #{palindrome? cat}"

cat = "a man a Plan a CAnal PanAMA"
puts "true: #{palindrome? cat}"

cat = "a88a"
puts "true: #{palindrome? cat}"

puts count_words ("a man, a plan, a canal -- Panama")
puts count_words "Doo bee doo bee doo"
=end
