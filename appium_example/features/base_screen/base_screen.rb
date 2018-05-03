require 'appium_lib'

class BaseScreen

  def self.identificator(element_name, &block)
    define_method(element_name.to_s, *block)
  end

  class << self
    alias_method :value, :identificator
    alias_method :action, :identificator
    alias_method :trait, :identificator
  end

  def method_missing(method, *args)
    if method.to_s.start_with?('touch_')
      wait_element_for_touch public_send(method.to_s.sub('touch_', ''))

    elsif method.to_s.start_with?('enter_')
      enter args[0], public_send(method.to_s.sub('enter_', ''))
    else
      super
    end
  end

  def check_trait(timeout)
    wait = Selenium::WebDriver::Wait.new timeout: timeout
    begin
      puts find_element(:id, trait).displayed?
      wait.until { find_element(:id, trait).displayed? }
    rescue Selenium::WebDriver::Error::TimeOutError => e
      raise "Element #{element} not found \n Error: #{e.message}"
    end
  end

  def wait_element_for_touch(element, timeout=10)
    wait = Selenium::WebDriver::Wait.new timeout: timeout
    begin
      wait.until { find_element(:id, element).click }
    rescue Selenium::WebDriver::Error::TimeOutError => e
      raise "Element #{element} not found \n Error: #{e.message}"
    end
  end

  def enter(text, element, timeout=10)
    wait = Selenium::WebDriver::Wait.new timeout: timeout
    begin
      wait.until { find_element(:id, element).send_keys text }
    rescue Selenium::WebDriver::Error::TimeOutError => e
      raise "Element #{element} not found \n Error: #{e.message}"
    end
  end

  def take_element_screenshot(element)
    screen_element = find_element(:id, element)
    element_screenshot(screen_element, File.join(path, screen_name))
  end

  def path
    Dir.mkdir(baseline_directory) unless Dir.exist?(baseline_directory)
    @path ||= File.join(FileUtils.pwd, 'baselines')
  end

  def baseline_directory
    @path ||= File.join(FileUtils.pwd, 'baselines')
  end

  def screen_name
    "#{@page.class.name}.png"
  end

  def screenshoots_path
    @screenshoots_path ||= File.join(FileUtils.pwd, 'screenshoots')
  end
end
