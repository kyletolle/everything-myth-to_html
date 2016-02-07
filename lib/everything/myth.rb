# encoding: UTF-8
require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

Dotenv.load

require_relative './add_write_html_to_to_piece_refinement'
require_relative './myth/to_html'

module Everything
  class Myth < Piece
    def self.find_by_name_recursive(myth_name)
      Piece.find_by_name_recursive(myth_name)
    end
  end
end

