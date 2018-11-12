module EmailCollector
  class PagesController
    def self.root
      template = File.read('./app/views/pages/root.html')
      [200, { 'Content-Type' => 'text/html' }, [template]]
    end
    def self.email
      template_email = File.read('./app/views/pages/email.html')
      [200, { 'Content-Type' => 'text/html' }, [template_email]]
    end
  end
end
