# encoding: UTF-8
require 'rubygems'
require 'bundler/setup'

require 'dotenv'
Dotenv.load

require 'fastenv'
require 'everything'

require_relative '../myth'
require_relative './to_html/output'
require_relative './to_html/template'

module Everything
  class Myth
    class ToHtml
      def convert
        myth   = Everything::Myth.new
        output = Output.new

        myth.write_html_to(output)

        output.save
      end
    end
  end
end

Everything::Myth::ToHtml.new.convert

