require 'sinatra'
require 'thin'

set :server, 'thin'
set :port, 3000
set :bind, '0.0.0.0'
set :public_folder, 'public'

get '/' do
  send_file File.join(settings.public_folder, 'index.html')
end

get '/events', provides: 'text/event-stream' do
  stream :keep_open do |out|
    EventMachine::PeriodicTimer.new(1) do
      message = "=> #{Time.now.strftime('%H:%M:%S')}"
      out << "data: #{message}\n\n"
    end
  end
end
