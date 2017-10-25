module EmailCollector
  class Email
    # YOUR CODE HERE
    attr_reader :email, :errors

    def initialize(email)
      @email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      @email = email
      @errors = ""
    end

    def save
      if @email =~ @email_regex
        File.open(EmailCollector::DATABASE, "a") {|file| file.puts @email}
        @errors = ""
        true
      else
        @errors = "Wrong email format."
        false
      end
    end

  end

end
