class Bwt
  def initialize(text)
    @text = text
  end

  def invert

  end
end

if __FILE__ == $0
  bwt_text = STDIN.gets
  bwt = Bwt.new(bwt_text)
  puts "#{bwt.invert}"
end