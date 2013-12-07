require 'rubygems'
require 'bundler'
Bundler.require(:default)
# require 'sass/plugin/rack'
require './app'

# use scss for stylesheets
# Sass::Plugin.options[:style] = :compressed
# use Sass::Plugin::Rack

# use coffeescript for javascript
# use Rack::Coffee, root: 'public', urls: '/javascripts'

run ZNCLogViewerAPI