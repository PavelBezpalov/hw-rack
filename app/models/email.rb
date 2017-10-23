module EmailCollector
  class Email
    # YOUR CODE HERE
    def initialize(email)

      if email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
        @email = email
      else
        puts "is not an email"
      end

    end

    attr_accessor :email

    email_file  = "/db/email_addresses.txt"
    address = @email
    File.open(email_file, "w+") do |f|
      f.write(address)
    end
  end
end
