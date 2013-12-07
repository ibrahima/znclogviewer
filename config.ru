require 'rubygems'
require 'bundler'
Bundler.require

require 'rack-livereload'
require './app'

use Rack::LiveReload


use Rack::Cors do
  allow do
    origins 'localhost:9000', '127.0.0.1:9000',
            /http:\/\/192\.168\.0\.\d{1,3}(:\d+)?/
            # regular expressions can be used here
    resource '*', :headers => :any, :methods => [:get, :post, :options]    
  end
end

run ZNCLogViewerAPI
