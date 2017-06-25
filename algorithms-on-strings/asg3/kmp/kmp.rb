def find_pattern(pattern, text)

end

if __FILE__ == $0
  pattern = STDIN.gets.strip
  text = STDIN.gets.strip
  result = find_pattern(pattern, text)
  puts result.join(" ")
end