require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400]
  def take_screenshot
    super if 'true'.casecmp?(ENV['SCREENSHOT'])
  end
end
