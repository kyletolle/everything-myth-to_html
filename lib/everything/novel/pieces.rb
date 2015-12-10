require 'kramdown'

class Everything
  class Novel
    class Pieces
      def write_html_to(output)
        piece_header = "[Home](/index.html)\n\n"
        pieces_markdown.each do |piece_name, piece_markdown|
          piece_html = Kramdown::Document
            .new(piece_header+piece_markdown)
            .to_html

          output.add_file(piece_name, piece_html)
        end
      end

    private

      def pieces
        days_of_writings = Dir.glob(File.join(Everything.path, Novel.path_fragment, '??.??.201?'))
        @pieces ||= days_of_writings.map do |piece_path|
          Piece.find(piece_path)
        end
      end

      def pieces_markdown
        pieces.map do |piece|
          [ piece.name, piece.raw_markdown ]
        end
      end
    end
  end
end

