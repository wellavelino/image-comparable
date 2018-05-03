class CalculatorScreen < BaseScreen

  identificator(:trait) { 'decor_content_parent' }
  identificator(:first_number) { 'android_field_first_number' }
  identificator(:second_number) { 'android_field_second_number' }
  identificator(:sum_button) { 'android_button_sum' }
  identificator(:subtraction_button) { 'android_button_sub' }
  identificator(:multiply_button) { 'android_button_mult' }
  identificator(:division_button) { 'android_button_div' }
  identificator(:result_field) { 'android_result_text' }

  def initialize(timeout)
    check_trait(timeout)
  end

  def calc(n1, n2, operator)
    sum_(n1, n2)
  end

  def check_result(expected, actual)
    (expected == actual)
    take_element_screenshot trait
  end

  def sum_(n1, n2)
    enter_first_number n1
    enter_second_number n2
    touch_sum_button

    result
  end

  def result
    find_element(:id, result_field).text
  end

end