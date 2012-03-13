class Help
  def self.for(parameters)
    "Here's help for #{parameters.join(" ")}"
  end

  def self.valid_parameters?(parameters)
    parameters.empty? || Command.valid?(parameters.join(" "))
  end
end