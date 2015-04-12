require 'fastenv'

class Everything
  class Collection
    class ToHtml
      class Output
        def initialize
          @content_output = ''
        end

        def add_content(content)
          @content_output += content
        end

        def save
          template         = Template.new
          rendered_content = template.render(@content_output)

          File.open(file_path, 'w') do |output_file|
            output_file.write(rendered_content)
          end
        end

      private

        def file_path
          output_path = Fastenv.html_output_path
          file_name   = 'index.html'

          File.join(output_path, file_name)
        end
      end
    end
  end
end

