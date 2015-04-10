# encoding: UTF-8
require 'rubygems'
require 'bundler/setup'

require 'dotenv'
Dotenv.load

require 'fastenv'

require 'kramdown'
require 'erb'
require 'tilt'

require_relative '../../everything'
require_relative '../collection'
require_relative '../piece'

class Everything
  class Collection
    class ToHtml
      def convert
        piece_number_range = (1..141)
        collection         = Everything::Collection.new(piece_number_range)
        forward_markdown   = collection.forward_markdown

        content_html = ""
        forward_html  = Kramdown::Document.new(forward_markdown).to_html
        content_html += forward_html

        page_break = "\n<hr/>\n"

        pieces_html = collection
          .pieces_markdown
          .map do |piece_markdown|
            piece_markdown = "#"+piece_markdown # Make each piece H2
            piece_html = Kramdown::Document.new(piece_markdown).to_html
            page_break + piece_html
          end
          .join('')
        content_html += pieces_html

        layout_and_content_html = Tilt.new(html_layout_path).render do
          content_html
        end

        File.open(output_file_path, 'w') do |output_file|
          output_file.write(layout_and_content_html)
        end
      end

    private
      def output_file_path
        output_path      = Fastenv.html_output_path
        output_file_name = 'index.html'

        File.join(output_path, output_file_name)
      end

      def html_layout_path
        File.join(Fastenv.template_path, 'layout.html.erb')
      end
    end
  end
end

Everything::Collection::ToHtml.new.convert

