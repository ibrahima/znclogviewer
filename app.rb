require 'sinatra'

class ZNCLogViewerAPI < Sinatra::Base
  get '/' do
    [].to_json
  end

  get '/users/?' do
    userdir = Dir.open(File.expand_path("~/.znc/users"))
    users = userdir.entries
    users.delete ".."
    users.delete "."
    ret = []
    users.each do  |u|
      netdir = Dir.open(File.expand_path("~/.znc/users/#{u}/networks"))
      networks = netdir.entries
      networks.delete ".."
      networks.delete "."
      ret << {name: u, networks: networks}
    end
    ret.to_json
  end

  get '/users/:user/networks/?' do
    netdir = Dir.open(File.expand_path("~/.znc/users/#{params[:user]}/networks"))
    networks = netdir.entries
    networks.delete ".."
    networks.delete "."
    networks.to_json
  end

end
