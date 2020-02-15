class Album < ApplicationRecord
  belongs_to :user

  paginates_per 10

  has_many :photos
  accepts_nested_attributes_for :photos, allow_destroy: true

  validates_uniqueness_of :name
  validates_length_of :name, maximum: 20
end
