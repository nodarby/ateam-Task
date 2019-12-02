class Topic < ApplicationRecord
  has_many :posts, dependent: :destroy
  validates :title, presence: true

  def self.search(search)
    if search
      Topic.where(['title LIKE ?', "%#{search}%"])
    else
      Topic.all
    end
  end
end
