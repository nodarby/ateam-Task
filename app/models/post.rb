class Post < ApplicationRecord
  belongs_to :topic
  validates :text, presence: true
end
