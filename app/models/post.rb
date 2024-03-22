class Post < ApplicationRecord
  belongs_to :user

  has_one_attached :photo

  validates :photo, :description, :user_id, presence: true

  has_many :comments, dependent: :destroy

  acts_as_votable
end