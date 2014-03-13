require 'rspec'
require 'cd_organizer'
# require 'cd_organizer_ui'

describe Cd do
  before do
    Cd.clear
  end
  it 'initializes the album name and artist' do
    test_cd = Cd.new({artist: 'Bob Dylan', album: 'Like a woman'})
    test_cd.should be_an_instance_of Cd
  end
  it 'saves the album name and artist' do
    test_cd = Cd.new({artist: 'Bob Dylan', album: 'Like a woman'})
    test_cd.album.should eq 'Like a woman'
    test_cd.artist.should eq 'Bob Dylan'
  end
  describe '.create' do
    it 'creates a new album and artist' do
    test_cd = Cd.create({artist: 'Bob Dylan', album: 'Like a woman'})
    test_cd2 = Cd.create({artist: 'Metallica', album: 'Black'})
    Cd.all[0].album.should eq 'Like a woman'
    Cd.all[1].artist.should eq 'Metallica'
    end
  end
  describe '.all' do
    it 'shows all the cds' do
      test_cd = Cd.create({artist: 'Bob Dylan', album: 'Like a woman'})
      Cd.all.should eq [test_cd]
    end
  end

  describe ".search" do
    it "should search through cds and find album title" do
      test_cd = Cd.create({artist: 'Bob Dylan', album: 'Like a woman'})
      test_cd2 = Cd.create({artist: 'Metallica', album: 'Black'})
      Cd.search('Bob Dylan').should eq test_cd
      Cd.search('Like a woman').should eq test_cd
      Cd.search('Metallica').should eq test_cd2
      Cd.search('Black').should eq test_cd2
    end
  end
end
