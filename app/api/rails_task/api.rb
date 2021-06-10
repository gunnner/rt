module RailsTask
  class API < Grape::API
    version 'v1', using: :path
    format :json
    prefix :api

    mount RailsTask::V1::Albums
    mount RailsTask::V1::Photos
    mount RailsTask::V1::Login
  end
end
