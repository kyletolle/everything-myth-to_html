require 'kramdown'

module Everything
  module AddWriteHtmlToToPieceRefinement
    refine Everything::Piece do
      attr_reader :parent

      def parent=(parent_piece)
        @parent = parent_piece
      end

      def write_html_to(output, header_markdown="")
        piece_html = Kramdown::Document
          .new(header_markdown+raw_markdown)
          .to_html

        output.add_file(File.join(parent.name, name), piece_html)
      end
    end
  end
end
