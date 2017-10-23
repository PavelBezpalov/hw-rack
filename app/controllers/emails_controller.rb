module EmailCollector
  class EmailsController
    def self.create(req)
      if req.params.key?('email')
        # YOUR CODE HERE
        [200, { 'Content-Type' => 'text/html' }, ['OK']]
      else
        [403, { 'Content-Type' => 'text/plain' }, ['Missing param: email']]
      end
    end
  end
end
