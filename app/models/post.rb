class Post < ApplicationRecord
  belongs_to :topic
  has_many :comments, dependent: :destroy
  validates :text, presence: true

  def self.search(search)
    if search
      Post.where(['text LIKE ?', "%#{search}%"])
    else
      Post.all
    end
  end
end
