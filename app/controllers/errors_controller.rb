module EmailCollector
  class ErrorsController
    def self.not_found
      [404, { 'Content-Type' => 'text/plain' }, ['Not found']]
    end
    def self.wrong_value
      template_error = File.read('./app/views/pages/error.html')
      [400, { 'Content-Type' => 'text/html' }, [template_error]]
    end
  end
end
