require './app/controllers/emails_controller'
require './app/controllers/errors_controller'
require './app/controllers/pages_controller'
require './app/models/email'

module EmailCollector
  DATABASE = './db/email_addresses.txt'.freeze

  class Application
    def self.call(env)
      req = Rack::Request.new(env)
      return PagesController.root             if req.get?  && req.path == '/'
      # YOUR CODE HERE
      if req.path =='/emails'
        email =Email.new(req['email'])
        if email
          if email.save
            EmailsController.create(req)
          else
            ErrorsController.not_found
          end
        end
      else

      end
    end
  end
end
