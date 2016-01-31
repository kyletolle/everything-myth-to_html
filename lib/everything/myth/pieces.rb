require 'kramdown'

module Everything
  class Myth
    class Pieces
      def initialize(version_path, version_name)
        @version_path = version_path
        @version_name = version_name
      end

      def write_html_to(output)
        home_header = "[Home](/index.html)\n\n"
        piece_header = "[#{@version_name}](../index.html)\n\n"
        pieces_markdown.each do |piece_name, piece_markdown|
          piece_html = Kramdown::Document
            .new(home_header+piece_header+piece_markdown)
            .to_html

          output.add_file(File.join(@version_name, piece_name), piece_html)
        end
      end

    private

      def pieces
        days_of_writings = Dir.glob(File.join(@version_path, '??.??.201?'))
        @pieces ||= days_of_writings.map do |piece_path|
          Piece.new(piece_path)
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

