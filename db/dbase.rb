require('pg')

class DBase

  def self.run(query)
    begin
      db = PG.connect({ dbname: 'music_collection', host: 'localhost' })
      result = db.exec(query)

    ensure
      db.close()

    end
    
    return result
  end
end