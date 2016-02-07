require_relative '../myth'

module Everything
  class Myth
    class CLI < Thor
      desc 'generate MYTH_NAME', 'generate an HTML site for the myth MYTH_NAME in your everything repo'
      def generate(myth_name)
        myth = Myth.find_by_name_recursive(myth_name)

        Everything::Myth::ToHtml.new(myth).convert
      end
    end
  end
end

Everything::Myth::CLI.start(ARGV)
