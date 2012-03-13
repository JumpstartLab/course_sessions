class Search
  def self.for(parameters)
    "Here's a search for #{parameters.join(" ")}"
  end

  def self.valid_parameters?(parameters)
    # TODO: check that attribute is actually valid
    parameters.count == 2
  end
end