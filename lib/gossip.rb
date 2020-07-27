require 'csv'

class gossip
  attr_accessor :author, :content

  def initialize(author, content)
      @content = content
      @author = author
    end

  def save
      CSV.open("./db/gossip.csv", "ab") do |csv|
          csv << [@author, @content]
      end
  end

  def self.all
  all_gossips = []
  CSV.read("./db/gossip.csv").each do |csv_line|
    all_gossips << gossip.new(csv_line[0], csv_line[1])
  end
  return all_gossips
end

  def self.find(id)
  gossips = []   # permet de stocker la ligne csv demandée
  CSV.read("./db/gossip.csv").each_with_index do |row, index|
    if (id == index+1)          # cherche et check si l'index est égale id demandé
      gossips << gossip.new(row[0], row[1])    # si trouvé, ajout dans array et break pour retourner l'array
      break
        end
      end
      return gossips
  end

  def self.update(id,author,content)
    gossips = []

    # recréé l'arrayt et csv avec les données modifiées.
		CSV.read("./db/gossip.csv").each_with_index do |row, index|
			if id.to_i == (index + 1)    # i
				gossips << [author, content]
			else
				gossips << [row[0], row[1]]
			end
		end

		CSV.open("./db/gossip.csv", "w") do |csv|
			gossips.each do |row|
				csv << row
    end
  end

end

end
