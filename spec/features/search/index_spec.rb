require 'rails_helper'

describe "As a user, when I visit '/search' page after selecting a search option from '/'" do
  it "I see the total number of people who live in that Nation" do
    visit search_path({nation: 'fire_nation'})

    expect(page).to have_content('Total Fire Nation Members: 97')
  end

  it "I see info for the first 25 members of that Nation" do
    visit search_path({nation: 'fire_nation'})

    within '.members-info' do
      expect(page.all('li', count: 25))
    end
  end

  describe "for each member's info" do
    before :each do
      conn = Faraday.new("https://last-airbender-api.herokuapp.com/api/v1/characters")
      response = conn.get("?perPage=100&page=1&affiliation=#{nation}")
      json = JSON.parse(response.body, symbolize_names: true)
      @members = json[0..24]
    end
    it "I see their name and photo (if available)" do
      @member
      visit search_path({nation: 'fire_nation'})

      within '.members-info' do
        within ''
        expect(page.all('li', count: 25))
      end
    end

    xit "I see a list of allies or 'None'" do

    end

    xit "I see a list of enemies or 'None'" do

    end

    xit "Any affiliations that the member has" do

    end
  end
end
