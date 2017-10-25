module EmailCollector
  class EmailsController
    def self.create(req)
      if req.params.key?('email')
        @email = Email.new(req['email'])
          if @email.save
            [201, { 'Content-Type' => 'text/plain' }, ['You successfully subscribed!']]
          else
            [422, { 'Content-Type' => 'text/plain' }, ['Errors: Wrong email format.']]
          end
      else
        [403, { 'Content-Type' => 'text/plain' }, ['Missing param: email']]
      end
    end
  end
end
