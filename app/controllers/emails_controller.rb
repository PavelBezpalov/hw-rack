module EmailCollector
  class EmailsController
    def self.create(req)
      if req.params.key?('email')
        if EmailCollector::Email.save(req.params["email"])
          return PagesController.email
        else
          return ErrorsController.wrong_value
        end
      else
        [403, { 'Content-Type' => 'text/plain' }, ['Missing param: email']]
      end
    end
  end
end
