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
      nation = 'fire+nation'
      conn = Faraday.new("https://last-airbender-api.herokuapp.com/api/v1/characters")
      response = conn.get("?perPage=3&page=1&affiliation=#{nation}")
      json = JSON.parse(response.body, symbolize_names: true)
      @members = json.map {|data| Character.new(data)}
      @member1 = @members.first
      @member2 = @members.second
      @member3 = @members.last
    end
    it "I see their name and photo (if available)" do
      visit search_path({nation: 'fire_nation'})

      within '.members-info' do
        within "#member-#{@member1.id}" do
          expect(page).to have_content("Name: #{@member1.name}")
        end
      end
    end

    it "I see a list of allies or 'None'" do
      visit search_path({nation: 'fire_nation'})

      within '.members-info' do
        within "#member-#{@member1.id}" do
          expect(page).to have_content("Allies: #{@member1.allies}")
        end
      end
    end

    it "I see a list of enemies or 'None'" do
      visit search_path({nation: 'fire_nation'})

      within '.members-info' do
        within "#member-#{@member1.id}" do
          expect(page).to have_content("Enemies: #{@member1.enemies}")
        end
      end
    end

    it "Any affiliations that the member has" do
      visit search_path({nation: 'fire_nation'})

      within '.members-info' do
        within "#member-#{@member1.id}" do
          expect(page).to have_content("Affiliation: #{@member1.affiliation}")
        end
      end
    end
  end
end
