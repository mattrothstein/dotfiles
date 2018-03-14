Pry.config.prompt_name = "💎  "
Pry.config.prompt = [ proc { "#{Pry.config.prompt_name}  --> " }, proc { |obj, nest_level| "#{nest_level}: #{Pry.config.prompt_name}  --> " }]

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

def dealer_with_the_most_loans
  Loan.select(:dealer_id).group(:dealer_id).order("count(dealer_id) desc").first.dealer
end
