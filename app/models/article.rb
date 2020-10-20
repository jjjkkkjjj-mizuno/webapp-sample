class Article < ApplicationRecord
    validates :tweet, presence: true
end
