module EmailCollector
  class Email
     DATABASE = './db/email_addresses.txt'
    attr_reader :email

    def initialize(email)
      @email = email
    end

    def self.save(email)
      if File.exist?(DATABASE)
      # binding.pry
        if email.match?(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
          File.open(DATABASE, "a") do |f|
          f.puts(email)
          end
          return true
        else
          return false
        end
      end
    end
  end
end
