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
        # If email is already in the database, ignore it, only add new ones
        emails_in_db = File.open(EmailCollector::DATABASE, 'r').read.split("\n")
        unless emails_in_db.index @email
          File.open(EmailCollector::DATABASE, 'a') { |f| f.puts @email }
        end
        @errors = ''
        true
      else
        @errors = 'Wrong email format.'
        false
      end
    end
  end
end
