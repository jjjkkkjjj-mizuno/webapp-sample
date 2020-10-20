class Article < ApplicationRecord
    # one to one
    belongs_to :user
    # one to many
    has_many :likes
    validates :tweet, presence: true
end
