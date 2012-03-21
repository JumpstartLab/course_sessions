module EventReporter
  class Queue

    def <<(item)
      data << item
    end

    def call(params)
      if params[0] == "count"
        data.count    
      else
        data.clear
      end
    end

    def count
      data.count
    end

    private

    def data
      @array ||= []
    end

    def self.valid_parameters?(parameters)
      if !%w(count clear print save).include?(parameters[0])
        false
      elsif parameters[0] == "print" 
        parameters.count == 1 || (parameters[1] == "by" && parameters.count == 3 )
      elsif parameters[0] == "save"
        parameters[1] == "to" && parameters.count == 3
      else
        true
      end
    end

  end
end