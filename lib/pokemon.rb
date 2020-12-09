class Pokemon

    attr_accessor :name, :type, :id, :db

    def initialize(id:, name:, type:, db:)
        @id, @name, @type, @db = id, name, type, db
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id, db)
        results = db.execute("SELECT * FROM pokemon WHERE id = ? LIMIT 1", id).flatten
        Pokemon.new(id: results[0], name: results[1], type: results[2], db: db)
    end

end
