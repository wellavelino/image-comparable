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
end
