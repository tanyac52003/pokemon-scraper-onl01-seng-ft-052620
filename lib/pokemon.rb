class Pokemon
  
  attr_reader :id, :name, :type, :db 
  @@all = []
  
  def initialize(id:, name:, type:, db:)
    @id = id 
    @name = name
    @type = type 
    @db = db 
    @@all << self 
  end 
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end 
  
  def self.find(id, db)
    found_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?;", id).flatten
    Pokemon.new(id:found_pokemon[0], name: name, type: type, db: db)
  end 
end
