class Pokemon
    attr_accessor :name, :type, :id, :db 

    def initialize(name:, type:, id:, db:)
        @name = name 
        @type = type 
        @id = id 
        @db = db
    end
    def self.save(name, type, db)
      
        sql = <<-SQL
        INSERT INTO pokemon (name, type)
        VALUES (?, ?)  
        SQL

        db.execute(sql, name, type)
    
    end

    def self.find(id_n, db)
        sql = <<-SQL 
        SELECT * 
        FROM pokemon
        WHERE id = ?
        SQL
      
        poke = db.execute(sql, id_n)[0]
        self.new(id: poke[0], name: poke[1], type: poke[2], db: db)
    end


end

