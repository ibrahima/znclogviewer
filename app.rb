require 'sinatra'

class ZNCLogViewerAPI < Sinatra::Base
  get '/' do
    [].to_json
  end

  get '/users/?' do
    userdir = Dir.open(File.expand_path("~/.znc/users"))
    users = userdir.entries
    users.delete '..'
    users.delete '.'
    ret = []
    users.each do  |u|
      netdir = Dir.open(File.expand_path("~/.znc/users/#{u}/networks"))
      networks = netdir.entries
      networks.delete '..'
      networks.delete '.'
      ret << {name: u, networks: networks}
    end
    ret.to_json
  end

  get '/users/:user/networks/?' do
    netdir = Dir.open(File.expand_path("~/.znc/users/#{params[:user]}/networks"))
    networks = netdir.entries
    networks.delete '..'
    networks.delete '.'
    networks.to_json
  end

  get '/users/:user/networks/:network/logs/?' do
    logdir = Dir.open(File.expand_path("~/.znc/users/#{params[:user]}/networks/#{params[:network]}/moddata/log"))
    files = logdir.entries
    files.delete '..'
    files.delete '.'
    files.map do |f|
      {
        name: f.sub(/^\#/, '')
      }
    end.to_json
  end

  get '/users/:user/networks/:network/logs/:file?' do
    logpath = File.expand_path("~/.znc/users/#{params[:user]}/networks/#{params[:network]}/moddata/log/")
    if File.exists?(File.join(logpath, params[:file]))
      f = File.open(File.join(logpath, params[:file]), "r:UTF-8")
    elsif File.exists?(File.join(logpath, "##{params[:file]}"))
      f = File.open(File.join(logpath, "##{params[:file]}"), "r:UTF-8")
    else
      status 404
      return { status: 404 }.to_json
    end
    {
      name: params[:file],
      lines: f.readlines.map do |line|
        u16= line.encode!('UTF-16', :undef => :replace, :invalid => :replace, :replace => "")
        line.encode!("UTF-8")

        matchdata = /\[(?<time>.+)\] \<(?<user>[^>]+)\> (?<message>.+)/.match(line)
        p matchdata
        if matchdata
          {
            time: matchdata[:time],
            user: matchdata[:user],
            message: matchdata[:message]
          }
        else
          nil
        end
      end.compact
    }.to_json
  end
end
