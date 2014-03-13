class Cd
  @@cds = []

  attr_reader(:album, :artist)

  def initialize(attributes)
    @album = attributes[:album]
    @artist = attributes[:artist]
  end

  def Cd.create(attributes)
    new_cd = Cd.new(attributes)
    @@cds << new_cd
    new_cd
  end

  def Cd.all
    @@cds
  end

  def Cd.clear
    @@cds = []
  end

  def Cd.search(input)
    Cd.all.each do |aa|
      if aa.artist ==input || aa.album == input
        return aa
      end
    end
  end


end
