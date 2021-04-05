require 'rails_helper'

RSpec.describe Character do
  describe 'happy path' do
    it 'should build a Character PORO based on input' do
      nation = 'fire+nation'
      conn = Faraday.new("https://last-airbender-api.herokuapp.com/api/v1/characters")
      response = conn.get("?perPage=10&page=1&affiliation=#{nation}")
      data = JSON.parse(response.body, symbolize_names: true)

      character = Character.new(data[1])
      expect(character).to be_a(Character)
      expect(character.id).to be_a(String)
      expect(character.name).to be_a(String)
      expect(character.allies).to be_an(Array)
      expect(character.enemies).to be_an(Array)
      expect(character.affiliation).to be_a(String)
    end
  end
end
