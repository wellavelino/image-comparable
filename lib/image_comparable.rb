require 'fileutils'

require_relative "#{File.dirname(__FILE__)}/image_comparable/version"
require_relative "#{File.dirname(__FILE__)}/image_comparable/matcher"
require_relative "#{File.dirname(__FILE__)}/image_comparable/image"
require_relative "#{File.dirname(__FILE__)}/image_comparable/image_diff"

module ImageComparable
  include ChunkyPNG::Color

  class SizesMismatchError < StandardError
  end

  def self.execute(baseline, current_screen, acceptant_criteria)
    return if baseline.nil?
    return if current_screen.nil?
    return if acceptant_criteria.nil?

    Matcher.new.compare_screens(baseline, current_screen, acceptant_criteria)
  end
end
