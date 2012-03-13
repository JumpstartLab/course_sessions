$LOAD_PATH << './'
require 'csv'
require 'attendee'

class EventManager
  CSV_OPTIONS = {:headers => true, :header_converters => :symbol}

  attr_accessor :attendees

  def initialize(filename, options = CSV_OPTIONS)
    load_attendees(CSV.open(filename, options))
  end

  def print_names
    attendees.each do |attendee|
      puts attendee.full_name
    end
  end

  def print_zipcodes
    attendees.each do |attendee|
      puts attendee.zipcode
    end
  end

  def print_phone_numbers
    attendees.each do |attendee|
      puts attendee.phone_number
    end
  end

  private

  def load_attendees(file)
    self.attendees = file.collect { |line| Attendee.new(line) }
  end

end

#em = EventManager.new("event_attendees.csv")
#em.print_zipcodes
#em.print_phone_numbers
#em.print_names
