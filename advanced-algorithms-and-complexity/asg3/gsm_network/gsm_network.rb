Edge = Struct.new(:from, :to)

if __FILE__ == $0
  n, m = STDIN.gets.strip.split.map(&:to_i)
  edges = []
  (0...m).each {
    edges << Edge.new(*STDIN.gets.strip.split.map(&:to_i))
  }
  convertToSat(edges)
end

def convertToSat(edges)
  # code here
end