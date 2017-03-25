class HeapBuilder
  attr_accessor :swaps, :data, :n

  def initialize
    @swaps = []
    @data = []
    @n = 0
  end

  def read_data
    input = STDIN.read.split().map { |x| x.to_i }
    @data = input[1..-1]
    @n = @data.length
  end

  def write_response
    puts "#{swaps.length}"
    swaps.each { |s|
      puts "#{s[0]} #{s[1]}"
    }
  end

  def generate_swaps_naive
    for i in 0..@data.length-1
      for j in i+1..@data.length-1
        if @data[i] > @data[j]
          swap(i,j)
        end
      end
    end
  end

  def swap(i,j)
    @swaps.push([i,j])
    @data[i],@data[j] = @data[j], @data[i]
  end

  def generate_swaps
    # write your code here - replace below with efficient solution
    generate_swaps_naive
  end

  def solve
    read_data
    generate_swaps
    write_response
  end
end

if __FILE__ == $0
  heap_builder = HeapBuilder.new
  heap_builder.solve
end