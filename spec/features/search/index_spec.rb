require 'rails_helper'

describe "As a user, when I visit '/search' page after selecting a search option from '/'" do
  it "I see the total number of people who live in that Nation" do
    # @nation = 'fire_nation'
    visit search_path({nation: 'fire_nation'})

    expect(page).to have_content('Total Fire Nation Members: 97')
  end

  it "I see info for the first 25 members of that Nation" do

  end

  describe "for each member's info" do
    it "I see their name and photo (if available)" do

    end

    it "I see a list of allies or 'None'" do

    end

    it "I see a list of enemies or 'None'" do

    end

    it "Any affiliations that the member has" do

    end
  end
end
