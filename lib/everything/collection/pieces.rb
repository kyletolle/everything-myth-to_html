require 'kramdown'

class Everything
  class Collection
    class Pieces
      def initialize(piece_number_range)
        @piece_number_range = piece_number_range
      end

      def write_html_to(output_file, &block)
        pieces_markdown.each do |piece_markdown|
          yield if block_given?

          piece_markdown = "#"+piece_markdown # Make each piece start with an H2.
          piece_html     = Kramdown::Document.new(piece_markdown).to_html

          output_file.add_content(piece_html)
        end
      end

    private

      def pieces
        @pieces ||= @piece_number_range.map do |piece_number|
          piece_name_blob = "#{piece_number}-*"
          Piece.find(piece_name_blob, within_path: Collection.path_fragment)
        end
      end

      def pieces_markdown
        pieces.map do |piece|
          piece.raw_markdown
        end
      end
    end
  end
end

