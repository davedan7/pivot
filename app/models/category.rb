class Category < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true

  has_many :item_categories
  has_many :items, through: :item_categories
  
  extend FriendlyId
  friendly_id :name, use: :slugged

  def can_destroy?
    items.count < 1
  end
end
