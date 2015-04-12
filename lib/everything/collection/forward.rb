require 'kramdown'

class Everything
  class Collection
    class Forward
      def initialize(collection_path)
        @collection_path = collection_path
        @piece           = Everything::Piece.new(@collection_path)
      end

      def write_html_to(output_file)
        forward_html = Kramdown::Document.new(markdown).to_html

        output_file.add_content(forward_html)
      end

      private

      def markdown
        @piece.raw_markdown
      end
    end
  end
end

