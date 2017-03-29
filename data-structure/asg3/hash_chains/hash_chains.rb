class QueryProcessor

  def initialize(num_buckets)
    @hash = Array.new(num_buckets) { Array.new }
    @num_buckets = num_buckets
  end

  def run
    queries = STDIN.readlines.map { |line|
      tuples = line.split
      op, oprand = tuples[0], tuples[1]
      if op == 'add'
        do_add(oprand)
      elsif op == 'del'
        do_del(oprand)
      elsif op == 'find'
        puts do_find(oprand)
      else
        puts do_check(oprand.to_i)
      end
    }
  end

  def do_find(oprand)

  end

  def do_check(oprand)

  end

  def do_del(oprand)

  end

  def do_add(oprand)

  end
end

if __FILE__ == $0
  num_buckets = STDIN.gets.to_i
  num_queries = STDIN.gets.to_i
  query_processor = QueryProcessor.new(num_buckets)
  query_processor.run
end