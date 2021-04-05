require 'rails_helper'

describe "As a user, when I visit '/' I see a select field" do
  it "when I select an option and click 'Search for Members' I am taken to the '/search' page" do
    visit root_path

    has_select?(:nation)

    select 'Fire Nation', from: :nation
    click_on 'Search For Members'

    expect(current_path).to eq('/search')
  end
end
