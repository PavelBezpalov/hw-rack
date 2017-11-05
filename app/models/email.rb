module EmailCollector
  class Email
    def initialize(address)
      @address = address
    end
    
    def errors
      @errors || ''
    end
    
    def save
      if @address =~ EmailCollector::EMAIL_REGEX
        File.open(EmailCollector::DATABASE, 'a') do |file|
          file.puts @address
        end
        true
      else
        @errors = 'Wrong email format.'
        false
      end
    end
  end
end
