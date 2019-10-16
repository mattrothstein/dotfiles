Pry.config.prompt_name = "💎  "
Pry.config.prompt = [ proc { "#{Pry.config.prompt_name}  --> " }, proc { |obj, nest_level| "#{nest_level}: #{Pry.config.prompt_name}  --> " }]
