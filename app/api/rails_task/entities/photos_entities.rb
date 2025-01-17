class RailsTask::Entities::PhotosEntities < Grape::Entity
  expose :image
  expose :created_at, as: :upload_date
  expose :author_id
  expose :album_id
end
