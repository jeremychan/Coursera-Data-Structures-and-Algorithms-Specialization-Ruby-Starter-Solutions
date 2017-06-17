def build_suffix_array(text)
  # code here
end

if __FILE__ == $0
  text = STDIN.gets.strip
  result = build_suffix_array(text)
  puts result.join(" ")
end
