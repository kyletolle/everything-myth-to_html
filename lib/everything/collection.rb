class Everything
  class Collection
    def self.path_fragment
      Fastenv.collection_relative_path
    end

    def initialize(piece_number_range)
      @piece_number_range = piece_number_range
    end

    def forward_markdown
      forward.markdown
    end

    def pieces_markdown
      pieces.map do |piece|
        piece.raw_markdown
      end
    end
  private

    def directory_path
      File.join(Everything.path, Fastenv.collection_relative_path)
    end

    def forward
      @forward ||= Everything::Collection::Forward.new(directory_path)
    end

    def pieces
      @pieces ||= @piece_number_range.map do |piece_number|
        piece_name_blob = "#{piece_number}-*"
        Piece.find(piece_name_blob, within_path: self.class.path_fragment)
      end
    end

    class Forward
      def initialize(collection_path)
        @collection_path = collection_path
        @piece           = Everything::Piece.new(@collection_path)
      end

      def markdown
        @piece.raw_markdown
      end
    end
  end
end
