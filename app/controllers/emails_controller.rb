module EmailCollector
  class EmailsController
    def self.create(req)
      address = req.params['email']
      if address
        email = Email.new(address)
        if email.save
          [
            201, { 'Content-Type' => 'text/plain' },
            ["You successfully subscribed! Email: #{address}"]
          ]
        else
          [
            422, { 'Content-Type' => 'text/plain' },
            ["Your email wasn't saved: #{address}. Errors: #{email.errors}"]
          ]
        end
      else
        [403, { 'Content-Type' => 'text/plain' }, ['Missing param: email']]
      end
    end
  end
end
