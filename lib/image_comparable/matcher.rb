require 'chunky_png'

class Matcher

  def compare_screens(baseline_path, screenshot_path, acceptant_criteria)
    baseline = ImageComparable::Image.new(baseline_path)
    screenshot = ImageComparable::Image.new(screenshot_path)

    raise 'cannot compare images with different sizes' unless
        baseline.size_match? screenshot

    ImageDiff.new(baseline, screenshot, acceptant_criteria).save
  end

end
