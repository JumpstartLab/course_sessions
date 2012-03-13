class EventDataParser
  def self.load(filename)
    puts "Loading the data from #{filename}!"
  end

  def self.valid_parameters?(parameters)
    parameters.count == 1 && parameters[0] =~ /\.csv$/
  end
end
