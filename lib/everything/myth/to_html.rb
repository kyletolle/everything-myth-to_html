require_relative './to_html/output'
require_relative './to_html/template'

module Everything
  module Myth
    class ToHtml
      using Everything::AddWriteHtmlToToPieceRefinement

      def initialize(myth)
        @myth = myth
      end

      def convert
        output = Output.new(myth.name)

        def myth.sub_piece_header_markdown
          "[Home](/index.html)\n\n"
        end

        def myth.piece_dir_name
          ''
        end

        myth.write_html_to(output)

        output.save
      end

    private

      attr_reader :myth
    end
  end
end

