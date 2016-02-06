require_relative './myth/index'
require_relative './myth/versions'
require_relative './add_pieces_to_piece_refinement'

module Everything
  class Myth
    using Everything::AddPiecesToPieceRefinement

    def self.path_fragment
      Fastenv.myth_relative_path
    end

    def write_html_to(output)
      index.write_html_to(output)

      versions.write_html_to(output)
    end

  private

    def directory_path
      File.join(Everything.path, self.class.path_fragment)
    end

    def index
      @index ||= Index.new(directory_path)
    end

    def versions
      Versions.new(index.public_pieces)
    end
  end
end

