module ImageComparable
  class Image

    attr_accessor :image

    def initialize(path)
      @image = ChunkyPNG::Image.from_file(path)
    end

    def size_match?(compare)
      @image.height == compare.image.height &&
          @image.width == compare.image.width
    end

    def delete_image!(image)
    end
  end
end
