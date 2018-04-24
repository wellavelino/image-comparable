class ImageDiff

  def initialize(baseline, screenshot, acceptant_criteria)
    @baseline   = baseline.image
    @screenshot = screenshot.image

    @diff = []
    @baseline.height.times do |y|
      @baseline.row(y).each_with_index do |pixel, x|
        @diff << [x, y] unless pixel == @screenshot[x, y]
      end
    end

    @x                  = @diff.map { |xy| xy[0] }
    @y                  = @diff.map { |xy| xy[1] }
    @acceptant_criteria = acceptant_criteria

  end

  def save
    Dir.mkdir(path) unless Dir.exist?(path)

    draw.save(File.join(path, file_name))
    calculate_score(@diff, @screenshot, @acceptant_criteria)
  end

  def calculate_score(diff, screenshot, acceptant_criteria)
    raise 'Acceptant criteria cannot be null' if acceptant_criteria.nil?

    acceptant_criteria = acceptant_criteria.to_f
    result             = (diff.length.to_f / screenshot.pixels.length) * 100

    return unless result > acceptant_criteria
    raise "The score result: #{result}%, is minor then " \
            "acceptant_criteria: #{acceptant_criteria}%"
  end

  def draw
    @screenshot.rect(@x.min, @y.min, @x.max, @y.max, ChunkyPNG::Color::BLACK)
  end

  def path
    @path ||= File.join(FileUtils.pwd, 'diff_images')
  end

  def file_name
    "#{Time.now.strftime('%Y%m%d')}_diff.png"
  end
end
