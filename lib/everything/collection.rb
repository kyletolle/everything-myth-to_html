require_relative './collection/forward'
require_relative './collection/page_break'
require_relative './collection/pieces'

class Everything
  class Collection
    def self.path_fragment
      Fastenv.collection_relative_path
    end

    def initialize(piece_number_range)
      @piece_number_range = piece_number_range
    end

    def write_html_to(output_file)
      forward.write_html_to(output_file)

      pieces.write_html_to(output_file) do
        PageBreak.write_html_to(output_file)
      end
    end

  private

    def directory_path
      File.join(Everything.path, self.class.path_fragment)
    end

    def forward
      Forward.new(directory_path)
    end

    def pieces
      Pieces.new(@piece_number_range)
    end
  end
end

