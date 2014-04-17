class User < ActiveRecord::Base

has_many :upvotes
has_many :reviews
has_many :resources
has_many :downvotes
has_many :reviews

# after_create :increase_points
# after_create :decrease_points

#   private

#   def increase_points
#       self.upvotes += 1
#   end

#   def decrease_points
#    self.downvotes -= 1
#  end


end