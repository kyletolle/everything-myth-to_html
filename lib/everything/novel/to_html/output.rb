require 'fastenv'
require 'fileutils'

class Everything
  class Novel
    class ToHtml
      class Output
        def initialize
          @chunks = []
        end

        def add_file(chunk_name, content)
          @chunks << { name: chunk_name, content: content }
        end

        def save
          write_css_file

          @chunks.each do |chunk|
            chunk_name = chunk[:name]
            content = chunk[:content]

            template = Template.new
            rendered_content = template.render(content)

            chunk_file_path = file_path(chunk_name)
            path_to_create  = Pathname.new(chunk_file_path).dirname
            FileUtils.mkdir_p(path_to_create)

            File.open(chunk_file_path, 'w') do |output_file|
              output_file.write(rendered_content)
            end
          end
        end

      private

        def write_css_file
          css_path = Pathname.new(output_path).dirname.join('css/style.css')
          File.open(css_path) do |css_file|
            css_contents = css_file.read
            css_output_path = File.join(output_path, 'style.css')
            File.open(css_output_path, 'w') do |css_output_file|
              css_output_file.write(css_contents)
            end
          end
        end

        def file_path(chunk_name)
          File.join(output_path, chunk_name, file_name)
        end

        def output_path
          Fastenv.html_output_path
        end

        def file_name
          'index.html'
        end
      end
    end
  end
end

