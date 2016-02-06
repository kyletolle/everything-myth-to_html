module Everything
  module AddPiecesToPieceRefinement
    refine Everything::Piece do
      def public_pieces
        pieces.select do |piece|
          piece.public?
        end
      end

      def pieces
        file_paths_under_piece = Dir.glob(File.join(full_path, '*'))

        sub_pieces_paths = file_paths_under_piece
          .select do |file_path_under_piece|
            File.directory?(file_path_under_piece)
          end

        sub_pieces_paths.map do |sub_piece_path|
          Piece.new(sub_piece_path)
        end
      end
    end
  end
end
