module EmailCollector
  class Email
    attr_reader :errors

    def initialize(email)
      @email_regex = /^[a-z0-9]+@[a-z0-9]+\.[a-z0-9]+$/i
      @errors = ''
      @email = email
    end

    def save
      if @email =~ @email_regex
        File.open(EmailCollector::DATABASE, 'a') { |f| f.puts @email }
        @errors = ''
        true
      else
        @errors = 'Wrong email format.'
        false
      end
    end
  end
end
