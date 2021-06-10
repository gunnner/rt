class RailsTask::V1::Photos < Grape::API

  namespace :photos do
    desc 'Return a list of photos'

    get do
      photos = Photo.all
      present photos, with: RailsTask::Entities::PhotosEntities
    end

  end
end
