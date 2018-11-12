module EmailCollector
  class EmailsController
    extend Renderable

    def self.create(req)
      if req.params.key?('email')
        email = Email.new(req.params["email"])
        if email.save
          render status: 201, text: 'You successfully subscribed!'
        else
          render status: 422, text: "Errors:  #{email.errors}"
        end
      else
        render status: 403, text: "Missing param: email"
      end
    end
  end
end
