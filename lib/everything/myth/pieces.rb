require 'kramdown'

module Everything
  class Myth
    class Pieces
      def initialize(day_pieces, version_name)
        @day_pieces = day_pieces
        @version_name = version_name
      end

      def write_html_to(output)
        home_header = "[Home](/index.html)\n\n"
        piece_header = "[#{@version_name}](../index.html)\n\n"
        @day_pieces.each do |day_piece|
          piece_name = day_piece.name
          piece_markdown = day_piece.raw_markdown

          piece_html = Kramdown::Document
            .new(home_header+piece_header+piece_markdown)
            .to_html

          output.add_file(File.join(@version_name, piece_name), piece_html)
        end
      end
    end
  end
end

