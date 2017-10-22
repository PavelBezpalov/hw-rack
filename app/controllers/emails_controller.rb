module EmailCollector
  class EmailsController
    def self.create(req)
      if req.params.key?('email')
        # YOUR CODE HERE
        SubscribeMailer.subscribe_email(@subscriber).deliver
      else
        [403, { 'Content-Type' => 'text/plain' }, ['Missing param: email']]
      end
    end
  end
end
