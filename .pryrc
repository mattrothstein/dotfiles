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

def do_sql(sql_string)
  ActiveRecord::Base.connection.execute(sql_string)
end
