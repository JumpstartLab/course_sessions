require 'ostruct'

class Zipcode
  def self.clean(dirty_zipcode)
    dirty_zipcode.to_s.rjust(5, '0')
  end
end

class PhoneNumber
  def initialize(phone_number)
    @phone_number = phone_number.scan(/\d/).join
  end

  def to_s
    "(#{@phone_number[0..2]}) #{@phone_number[3..5]}-#{@phone_number[6..-1]}"
  end
end

class Attendee < OpenStruct

  def initialize(attributes)
    # Clean the attributes data?
    super
  end

  def full_name
    [first_name, last_name].join(' ')
  end

  def zipcode
    Zipcode.clean(super)
  end

  def phone_number
    PhoneNumber.new(homephone)
  end

end

