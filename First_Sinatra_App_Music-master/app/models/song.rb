class Song < ActiveRecord::Base
  belongs_to :user
  has_many :upvotes
  has_many :ratings
  has_many :users, through: :upvotes
  has_many :users, through: :ratings

validates :author,
          presence: true,
          length: { minimum: 3 }

validates :song_title,
          presence: true,
          length: { minimum: 3 }

validates_format_of :url, with: URI.regexp


  def self.top_10
    Song.all.limit(10).sort { |x, y| y.upvotes.count <=> x.upvotes.count }
  end
end