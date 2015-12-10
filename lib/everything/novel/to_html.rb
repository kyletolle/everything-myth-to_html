# encoding: UTF-8
require 'rubygems'
require 'bundler/setup'

require 'dotenv'
Dotenv.load

require 'fastenv'

require_relative '../../everything'
require_relative '../novel'
require_relative '../piece'
require_relative './to_html/output'
require_relative './to_html/template'

class Everything
  class Novel
    class ToHtml
      def convert
        novel              = Everything::Novel.new
        output             = Output.new

        novel.write_html_to(output)

        output.save
      end
    end
  end
end

Everything::Novel::ToHtml.new.convert

