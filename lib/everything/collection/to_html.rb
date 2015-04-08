# encoding: UTF-8
require 'rubygems'
require 'bundler/setup'

require 'dotenv'
Dotenv.load

require 'fastenv'

require 'kramdown'
require 'erb'
require 'tilt'

class Everything
  def self.path
    Fastenv.everything_path
  end

  class Collection
    def self.path_fragment
      Fastenv.collection_relative_path
    end

    class ToHtml
      def convert
        collection_index_file = File.join(collection_path, 'index.md')

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

              piece = Piece.new("#{piece_number}-*", within_path: Collection.path_fragment)
              piece_markdown = "#"+piece.raw_markdown # Make each piece H2

              piece_html = Kramdown::Document.new(piece_markdown).to_html
              collection_html += piece_html
            end

            collection_html
          end
          output_html << html

        end
      end

    private
      def collection_path
        File.join(Everything.path, Fastenv.collection_relative_path)
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

  end

  class Piece
    def initialize(piece_name, options={})
      @piece_name  = piece_name
      @within_path = options[:within_path]
    end

    def title
      @title ||= partitioned_content.first.sub('# ', '')
    end

    def content
      @content ||= partitioned_content.last
    end

    def raw_markdown
      @raw_markdown ||= File.read(content_path)
    end

  private
    def directory_path
      unless @directory_path
        glob_path = File.join(Everything.path, @within_path, '**', @piece_name)
        possible_dirs = Dir.glob glob_path

        @directory_path = possible_dirs.first
      end

      @directory_path
    end

    def content_path
      @content_path ||= File.join(directory_path, 'index.md')
    end

    def partitioned_content
      @partitioned_content ||= raw_markdown.partition("\n\n")
    end
  end
end

Everything::Collection::ToHtml.new.convert

