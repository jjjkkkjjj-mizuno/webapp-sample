class Article < ApplicationRecord
    # one to one
    belongs_to :user
    validates :tweet, presence: true
end
