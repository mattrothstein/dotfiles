Pry.config.prompt_name = "💎"
Pry.config.prompt = proc { |obj, nest_level, _| "#{Pry.config.prompt_name}  #{obj}:#{nest_level} ---> " }
def fl(loan_id)
  Loan.find(loan_id)
end

def fq(quote_id)
  Quote.find(quote_id)
end

def fc(customer_id)
  Customer.find(customer_id)
end

def time(&block)
  puts Benchmark.measure(&block)
end
