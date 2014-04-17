class Resource < ActiveRecord::Base

belongs_to :user
# has_many :upvotes
# has_many :downvotes
# has_many :reviews


#   t.string :title
#       t.string :topic
#       t.string :url
#       t.string :user_id

# validates :title,
#           presence: true,
#           length: { minimum: 3 }

# validates :topic,
#           presence: true,
#           length: { minimum: 3 }

validates_format_of :url, with: URI.regexp

end