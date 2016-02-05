require 'kramdown'

module Everything
  class Myth
    class Index
      def initialize(myth_path)
        @myth_path = myth_path
        @piece     = Everything::Piece.new(@myth_path)
      end

      def write_html_to(output)
        index_html = Kramdown::Document.new(markdown).to_html

        output.add_file('', index_html)
      end

      def public_pieces
        @piece.public_pieces
      end

      private

      def markdown
        @piece.raw_markdown
      end
    end
  end
end

