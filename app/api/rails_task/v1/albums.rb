class RailsTask::V1::Albums < Grape::API

  namespace :albums do
    desc 'Return a list of albums'

    get do
      albums = Album.all
      present albums, with: RailsTask::Entities::AlbumsEntities
    end
  end
end
