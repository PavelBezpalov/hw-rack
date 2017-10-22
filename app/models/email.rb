module EmailCollector
  class Email
    # YOUR CODE HERE
    validates :email, presence: true, uniqueness: true
    def subscribe_email(subscriber)
   @subscriber = subscriber
   mail(to: @subscriber.email, subject: "New subscriber", cc: "admin@site.com"
end
  end
end
