require_relative './myth/index'
require_relative './myth/page_break'
require_relative './myth/versions'

module Everything
  class Myth
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

