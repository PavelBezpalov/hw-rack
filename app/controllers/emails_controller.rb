module EmailCollector
  class EmailsController
    def self.create(req)
      email = req.params['email']
      if email
        @email = Email.new(email)
        if @email.save
          [
            201, { 'Content-Type' => 'text/plain' },
            ["You successfully subscribed! Email: #{email}"]
          ]
        else
          [
            422, { 'Content-Type' => 'text/plain' },
            ["Your email wasn't saved: #{email}. Errors: #{@email.errors}"]
          ]
        end

      else
        [403, { 'Content-Type' => 'text/plain' }, ['Missing param: email']]
      end
    end
  end
end
