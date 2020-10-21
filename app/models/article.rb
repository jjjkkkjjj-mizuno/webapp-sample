class Article < ApplicationRecord
    # one to one
    belongs_to :user
    # one to many
    has_many :likes
    has_many :notifications

    validates :tweet, presence: true
end
