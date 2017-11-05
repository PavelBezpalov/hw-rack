module Renderable
  def render(params = {})
    ResponseBuilder.new(params).call
  end
  
  class ResponseBuilder
    def initialize(status: nil, text: nil)
      @status = status
      @text = text
    end
    
    def call
      [@status, { 'Content-Type' => 'text/plain' }, [@text]]
    end
  end
end
