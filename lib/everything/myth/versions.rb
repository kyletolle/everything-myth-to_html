require 'kramdown'
require_relative './pieces'

module Everything
  class Myth
    class Versions
      def initialize(version_pieces)
        @version_pieces = version_pieces
      end

      def write_html_to(output)
        version_header = "[Home](/index.html)\n\n"
        @version_pieces.each do |version_piece|
          version_path = version_piece.full_path
          version_name = version_piece.name
          version_markdown = version_piece.raw_markdown

          version_html = Kramdown::Document
            .new(version_header+version_markdown)
            .to_html

          output.add_file(version_name, version_html)

          Pieces.new(version_piece.public_pieces, version_name).write_html_to(output)
        end
      end
    end
  end
end
