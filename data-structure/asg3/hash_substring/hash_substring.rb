def get_occurrences(pattern, text)
  p = pattern.length
  t = text.length

  (0..t - p).map { |i|
    text[i...i+p] == pattern ? i : nil
  }.compact
end

if __FILE__ == $0
  pattern, text = STDIN.read.split
  puts "#{get_occurrences(pattern, text).join(' ')}"
end