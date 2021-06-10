class RailsTask::Entities::AlbumsEntities < Grape::Entity
  expose :name, as: :album_name
  expose :photos_counter, as: :amount_of_photo
  expose :user_id, as: :album_author_id
  expose :updated_at
end
