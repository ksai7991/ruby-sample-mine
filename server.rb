require 'sinatra'
require 'cowsay'

port = ENV["PORT"] || "8080"
configure { 
  set :server, :puma
  set :bind, '0.0.0.0'
  set :port, port
}

# Route for the root URL
get '/' do
  content_type "text/plain"
  message = params[:message]
  if message.nil?
    message = "Set a message by adding ?message=<message here> to the URL"
  end

  Cowsay.say(message, "random")
end

# Route for /hi that returns "hi"
get '/hi' do
  "hi"
end
