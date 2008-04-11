module Sample
  module EventContext
    def echo(input)
      input
    end
  end
end

Sinatra::EventContext.send(:include, Sample::EventContext)
      