Then(/^the user validates the speaker (.+) is present$/) do |presenter_name|
  expect(@browser.div(id: 'comp-j95s0bdn').text.split("\n").first.strip).to eq(presenter_name)
end