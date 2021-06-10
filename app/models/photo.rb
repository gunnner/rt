class Photo < ApplicationRecord
  mount_uploader :image, PhotoUploader

  paginates_per 10

  belongs_to :album, counter_cache: :photos_counter
end
