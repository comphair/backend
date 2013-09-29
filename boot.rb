# TODO: put in ENV
require "pry"
require "awesome_print"
require "better_errors"
require "grape"
require "active_record"

Dir["#{File.dirname(__FILE__)}/app/**/*.rb"].each {|f| require f}


ActiveRecord::Base.establish_connection(YAML.load(File.read("config/database.yml")))

# ActiveRecord::Schema.define do
#   create_table :albums do |table|
#     table.column :title, :string
#     table.column :performer, :string
#   end

#   create_table :tracks do |table|
#     table.column :album_id, :integer
#     table.column :track_number, :integer
#     table.column :title, :string
#   end
# end

class Album < ActiveRecord::Base
    has_many :tracks
end

class Track < ActiveRecord::Base
    belongs_to :album
end

album = Album.create(:title => 'Black and Blue',
    :performer => 'The Rolling Stones')
album.tracks.create(:track_number => 1, :title => 'Hot Stuff')
album.tracks.create(:track_number => 2, :title => 'Hand Of Fate')
album.tracks.create(:track_number => 3, :title => 'Cherry Oh Baby ')
album.tracks.create(:track_number => 4, :title => 'Memory Motel ')
album.tracks.create(:track_number => 5, :title => 'Hey Negrita')
album.tracks.create(:track_number => 6, :title => 'Fool To Cry')
album.tracks.create(:track_number => 7, :title => 'Crazy Mama')
album.tracks.create(:track_number => 8,
    :title => 'Melody (Inspiration By Billy Preston)')

album = Album.create(:title => 'Sticky Fingers',
    :performer => 'The Rolling Stones')
album.tracks.create(:track_number => 1, :title => 'Brown Sugar')
album.tracks.create(:track_number => 2, :title => 'Sway')
album.tracks.create(:track_number => 3, :title => 'Wild Horses')
album.tracks.create(:track_number => 4,
    :title => 'Can\'t You Hear Me Knocking')
album.tracks.create(:track_number => 5, :title => 'You Gotta Move')
album.tracks.create(:track_number => 6, :title => 'Bitch')
album.tracks.create(:track_number => 7, :title => 'I Got The Blues')
album.tracks.create(:track_number => 8, :title => 'Sister Morphine')
album.tracks.create(:track_number => 9, :title => 'Dead Flowers')
album.tracks.create(:track_number => 10, :title => 'Moonlight Mile')

puts Album.find(1).tracks.length
puts Album.find(2).tracks.length

puts Album.find_by_title('Sticky Fingers').title
puts Track.find_by_title('Fool To Cry').album_id

ApplicationServer = Rack::Builder.new do
  use BetterErrors::Middleware
  run API::Hairdressers
end