require 'kramdown'
require_relative '../add_pieces_to_piece_refinement'
require_relative '../add_write_html_to_to_piece_refinement'

module Everything
  class Myth
    class Versions
      using Everything::AddPiecesToPieceRefinement
      using Everything::AddWriteHtmlToToPieceRefinement

      def initialize(version_pieces)
        @version_pieces = version_pieces
      end

      def write_html_to(output)
        home_header = "[Home](/index.html)\n\n"
        @version_pieces.each do |version_piece|
          version_path = version_piece.full_path
          version_name = version_piece.name
          version_markdown = version_piece.raw_markdown

          version_html = Kramdown::Document
            .new(home_header+version_markdown)
            .to_html

          output.add_file(version_name, version_html)

          write_sub_piece_html_to(output, version_piece, home_header)
        end
      end

      def write_sub_piece_html_to(output, version_piece, home_header)
        version_header_markdown = home_header +
          "[#{version_piece.name}](../index.html)\n\n"
        version_piece.public_pieces.each do |sub_piece|
          sub_piece.parent = version_piece
          sub_piece.write_html_to(output, version_header_markdown)
        end
      end
    end
  end
end
