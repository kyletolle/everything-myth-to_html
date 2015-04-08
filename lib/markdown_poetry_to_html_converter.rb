# encoding: UTF-8
require 'rubygems'
require 'bundler/setup'

require 'dotenv'
Dotenv.load

require 'fastenv'

require 'kramdown'
require 'erb'
require 'tilt'

class MarkdownPoetryToHtmlConverter
  def convert
    collection_index_file = File.join(poetry_collection_path, 'index.md')

    collection_index_markdown = File.read collection_index_file

    collection_index_html = Kramdown::Document.new(collection_index_markdown)
      .to_html

    File.open(output_file_path, 'w') do |output_html|
      html = Tilt.new(html_layout_path).render do
        collection_html = ""
        collection_html += collection_index_html

        piece_range = (1..141)

        piece_range.each do |piece_number|
          collection_html += "\n<hr/>\n"
          piece_glob = File.join(poetry_collection_path, "#{piece_number}-*")
          piece_path = Dir[piece_glob].first
          piece_markdown_file = File.join(piece_path, 'index.md')

          piece_markdown = File.read piece_markdown_file
          piece_markdown = "#"+piece_markdown # Make them H2
          piece_html = Kramdown::Document.new(piece_markdown).to_html
          collection_html += piece_html
        end

        collection_html
      end
      output_html << html

    end
  end

private
  def poetry_collection_path
    Fastenv.everything_poetry_collection_path
  end

  def output_file_path
    output_path      = Fastenv.html_output_path
    output_file_name = 'index.html'

    File.join(output_path, output_file_name)
  end

  def html_layout_path
    File.join(Fastenv.template_path, 'layout.html.erb')
  end

end

MarkdownPoetryToHtmlConverter.new.convert


