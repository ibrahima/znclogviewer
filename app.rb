require 'sinatra'

class ZNCLogViewerAPI < Sinatra::Base
  get '/' do
    [].to_json
  end
end
