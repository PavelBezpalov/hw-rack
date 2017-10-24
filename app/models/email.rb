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
        puts @email
        @errors=''
        true
      else
        @errors = 'Wrong email format.'
        false
      end
    end

  end
end
