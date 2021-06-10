class AddPhotosCounterToAlbums < ActiveRecord::Migration[5.1]
  def change
    add_column :albums, :photos_counter, :integer, default: 0
  end
end
