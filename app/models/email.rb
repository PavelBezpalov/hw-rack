module EmailCollector
  class Email
    def initialize(address)
      @address = address
    end
    
    def errors
      @errors || ''
    end
    
    def save
      if @address == '' || @address == 'email@'
        @errors = 'Wrong email format.'
        false
      else
        File.open(EmailCollector::DATABASE, 'a') do |file|
          file.puts @address
        end
        true
      end
    end
  end
end
