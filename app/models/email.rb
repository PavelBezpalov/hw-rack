module EmailCollector
  class Email
    def initialize(address)
      @email_regex = /^[a-z0-9]+@[a-z0-9]+\.[a-z0-9]+$/i
      @address = address
    end

    def errors
      @errors ||= ''
    end

    def save
      if @address =~ @email_regex
        File.open(EmailCollector::DATABASE, 'a') { |f| f.puts @address }
        @errors = ''
        true
      else
        @errors = 'Wrong email format.'
        false
      end
    end
  end
end
