class Everything
  class Collection
    class PageBreak
      def self.write_html_to(output_file)
        output_file.add_content(html_line_break)
      end

    private

      def self.html_line_break
        "\n<hr/>\n"
      end
    end
  end
end

