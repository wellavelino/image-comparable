Given("I on the calculator screen") do
  @page = CalculatorScreen.new(30)
end

When("sum {int} {string} {int}") do |n1,operator, n2|
  @page.calc(n1, n2, operator)
end

Then("i see {int} from the calculation") do |expect|
  @page.check_result(expect, @result)
  # validade the difference between screens
  ImageComparable.execute(File.join(@page.path,'NilClass.png'),
                          File.join(@page.screenshoots_path, 'well.png'),
                          1)
end
