'require pry'
class Pokemon

  attr_accessor :name, :type, :db
  attr_reader :id

  def initialize(pokemon)
    @pokemon = pokemon
    @id = pokemon[:id]
    @name = pokemon[:name]
    @type = pokemon[:type]
    @db = pokemon[:db]
  end

  def self.save (name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end


  def self.find(id_num, db)
  #  binding.pry
    poke = db.execute("SELECT * from pokemon where id=?", id_num).flatten
    poke_hash = {id: poke[0], name: poke[1], type: poke[2]}
    Pokemon.new(poke_hash)

  end

end

# Your only
#job is to build out the methods to save and find pokemon in the database.
