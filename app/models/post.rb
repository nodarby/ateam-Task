class Post < ApplicationRecord
  belongs_to :topic
  has_many :comments, dependent: :destroy
  validates :text, presence: true
end
