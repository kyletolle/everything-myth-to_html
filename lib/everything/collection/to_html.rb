# encoding: UTF-8
require 'rubygems'
require 'bundler/setup'

require 'dotenv'
Dotenv.load

require 'fastenv'

require_relative '../../everything'
require_relative '../collection'
require_relative '../piece'
require_relative './to_html/output'
require_relative './to_html/template'

class Everything
  class Collection
    class ToHtml
      def convert
        piece_number_range = (1..141)
        collection         = Everything::Collection.new(piece_number_range)
        output_file        = Output.new

        collection.write_html_to(output_file)

        output_file.save
      end
    end
  end
end

Everything::Collection::ToHtml.new.convert

