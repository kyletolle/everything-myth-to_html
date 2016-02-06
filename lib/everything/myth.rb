require_relative './add_write_html_to_to_piece_refinement'

module Everything
  class Myth
    using Everything::AddWriteHtmlToToPieceRefinement

    def self.path_fragment
      Fastenv.myth_relative_path
    end

    def write_html_to(output)
      def piece.sub_piece_header_markdown
        "[Home](/index.html)\n\n"
      end
      def piece.piece_dir_name
        ''
      end
      piece.write_html_to(output)
    end

  private

    def piece
      @piece ||= Piece.new(myth_full_path)
    end

    def myth_full_path
      File.join(Everything.path, self.class.path_fragment)
    end
  end
end

