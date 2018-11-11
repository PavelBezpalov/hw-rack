module EmailCollector
  class Email
    # YOUR CODE HERE
    def initialize(email)
        @errors = ''
        @email = email
    end

    def errors
      @errors
    end

    def save
      if @email[/(^[-._a-z0-9]+@(?:[a-z0-9][-a-z0-9]+\.)+[a-z]{2,6}$)/]
        # тут надо написать код
        File.open(EmailCollector::DATABASE, "a"){|file| file.puts @email}
        # puts @email
        @errors=''
        true
      else
        @errors = 'Wrong email format.'
        false
      end
    end

  end
end
