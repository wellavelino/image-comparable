require 'appium_lib'

# Class to not pollute 'Object' class with appium methods
class AppiumWorld
end

# rubocop:disable Metrics/LineLength
caps = Appium.load_appium_txt file: File.expand_path("../caps/#{ENV['PLATFORM']}/appium.txt", __FILE__),
                              verbose: true

Appium::Driver.new(caps)
Appium.promote_appium_methods Object

World do
  AppiumWorld.new
end
