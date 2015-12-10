require_relative './novel/index'
require_relative './novel/page_break'
require_relative './novel/pieces'

class Everything
  class Novel
    def self.path_fragment
      Fastenv.novel_relative_path
    end

    def write_html_to(output)
      index.write_html_to(output)

      pieces.write_html_to(output)
    end

  private

    def directory_path
      File.join(Everything.path, self.class.path_fragment)
    end

    def index
      Index.new(directory_path)
    end

    def pieces
      Pieces.new
    end
  end
end

