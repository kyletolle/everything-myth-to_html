require 'kramdown'

class Everything
  class Novel
    class Index
      def initialize(novel_path)
        @novel_path = novel_path
        @piece      = Everything::Piece.new(@novel_path)
      end

      def write_html_to(output)
        index_html = Kramdown::Document.new(markdown).to_html

        output.add_file('', index_html)
      end

      private

      def markdown
        @piece.raw_markdown
      end
    end
  end
end

