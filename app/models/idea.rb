class Idea < ApplicationRecord
  validates :title, presence: true
  validates :subject, presence: true, unless: :was_attached?
  validates :category_id,         numericality: { other_than: 1, message: "can't be blank" }
  def was_attached?
    self.image.attached?
  end
  belongs_to :user
  has_many :comments
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
end
