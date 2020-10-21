class User < ApplicationRecord
  # one to many
  has_many :articles
  has_many :likes
  has_many :follows
  has_many :notifications

  validates :account_id, :account_name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
