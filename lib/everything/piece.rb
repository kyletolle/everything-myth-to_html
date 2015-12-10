class Everything
  class Piece
    def self.find(piece_path)
      Piece.new(piece_path)
    end

    def initialize(full_path)
      @full_path = full_path
    end

    def name
      Pathname.new(@full_path).basename
    end

    def title
      @title ||= partitioned_content.first.sub('# ', '')
    end

    def content
      @content ||= partitioned_content.last
    end

    def raw_markdown
      @raw_markdown ||= File.read(content_path)
    end

  private

    def content_path
      @content_path ||= File.join(@full_path, 'index.md')
    end

    def partitioned_content
      @partitioned_content ||= raw_markdown.partition("\n\n")
    end
  end
end
