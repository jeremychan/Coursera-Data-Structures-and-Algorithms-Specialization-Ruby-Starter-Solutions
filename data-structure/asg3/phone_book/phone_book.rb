class Instruction
  attr_accessor :op, :number, :name

  def initialize(op, number, name = nil)
    @op = op
    @number = number
    @name = name
  end

  def to_s
    "#{@op} #{@number} #{@name}"
  end
end

class PhoneBook
  def read_input
    instructions = STDIN.readlines.map {|line|
      tuples = line.split
      if tuples.length == 3
        Instruction.new(tuples[0], tuples[1], tuples[2])
      else
        Instruction.new(tuples[0], tuples[1])
      end
    }
    instructions
  end

  def process_input(instructions)
    "not found"
  end

  def run
    instructions = read_input
    puts "instructions = #{instructions.map {|i| i.to_s }}"
    puts process_input(instructions)
  end
end

if __FILE__ == $0
  phonebook = PhoneBook.new
  phonebook.run
end
