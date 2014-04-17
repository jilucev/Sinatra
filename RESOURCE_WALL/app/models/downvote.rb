class Downvote < ActiveReord::Base
  belongs_to :user
  belongs_to :resource


end