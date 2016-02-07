# encoding: UTF-8
require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)
Dotenv.load

module Everything
  module Myth
  end
end

require_relative './add_write_html_to_to_piece_refinement'
require_relative './myth/to_html'
require_relative './myth/cli'

