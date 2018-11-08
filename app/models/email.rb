module EmailCollector
  class Email
    # YOUR CODE HERE
    def initialize(email)
        @email = email
        @errors = ''
    end

    def errors
      @errors
    end

    def save
      if @email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
        File.open(EmailCollector::DATABASE, "w+") { |f| f.write(@email) } 
        @errors = ''
        true
      else
        @errors = 'Wrong email format.'
        false
      end
    end
  end
end
