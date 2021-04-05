require 'rails_helper'

describe "As a user, when I visit '/' I see a select field" do
  it "when I select an option and click 'Search for Members' I a, taken to the '/search' page" do
    visit root_path

    has_select?(:nation)

    select 'Fire Nation', from: :nation
    click_button 'Search for Members'

    expect(current_path).to eq('/search')
  end
end
# Then I should see the total number of people who live in the Fire Nation. (should be close to 100)
# And I should see a list with the detailed information for the first 25 members of the Fire Nation.
# And for each of the members I should see:
# - The name of the member (and their photo, if they have one)
# - The list of allies or "None"
# - The list of enemies or "None"
# - Any affiliations that the member has
