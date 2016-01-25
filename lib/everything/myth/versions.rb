require 'kramdown'
require_relative './pieces'

class Everything
  class Myth
    class Versions
      def write_html_to(output)
        version_header = "[Home](/index.html)\n\n"
        versions_markdown.each do |version_path, version_name, version_markdown|
          version_html = Kramdown::Document
            .new(version_header+version_markdown)
            .to_html

          output.add_file(version_name, version_html)

          Pieces.new(version_path, version_name).write_html_to(output)
        end
      end

    private

      def versions
        versions = Dir.glob(File.join(Everything.path, Myth.path_fragment, 'v*'))
        @versions ||= versions.map do |version_path|
          [ version_path, Piece.find(version_path) ]
        end
      end

      def versions_markdown
        versions.map do |version_path, version|
          [ version_path, version.name, version.raw_markdown ]
        end
      end
    end
  end
end
