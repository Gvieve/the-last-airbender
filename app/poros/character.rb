class Character
  attr_reader :id,
              :name,
              :photo_link,
              :allies,
              :enemies,
              :affiliation

  def initialize(data)
    @id = data[:_id]
    @name = data[:name]
    @photo_link = data[:photoUrl] ? data[:photoUrl] : ''
    @allies = data[:allies] ? data[:allies] : 'None'
    @enemies = data[:enemies] ? data[:enemies] : 'None'
    @affiliation = data[:affiliation] ? data[:affiliation] : 'None'
  end
end
