class Bwt
  def initialize(text)
    @text = text
  end

  def transform

  end
end

if __FILE__ == $0
  text = STDIN.gets
  bwt = Bwt.new(text)
  puts "#{bwt.transform}"
end