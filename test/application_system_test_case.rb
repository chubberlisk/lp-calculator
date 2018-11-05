require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  # driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
  Capybara.register_driver :headless_chrome do |app|
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('headless')
    Capybara::Selenium::Driver.new(app, :browser => :chrome, :options => options)
  end
  driven_by :headless_chrome
end
