Given(/^the user navigates to the qa or highway speakers webpage$/) do
  @browser = Watir::Browser.new(:chrome)
  @browser.goto('https://www.qaorthehighway.com/speakers')
end