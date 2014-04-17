class User < ActiveRecord::Base

has_many :upvotes
has_many :ratings
has_many :songs, through: :upvotes
has_many :songs, through: :ratings

  validates :email, presence: true
  validates :password, presence: true

  def already_voted?(song)
    !!self.upvotes.find_by(song_id: song.id)
  end

  def already_rated?(song)
    !!self.ratings.find_by(song_id: song.id)
  end
end