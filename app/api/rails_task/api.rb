module RailsTask
  class API < Grape::API
    version 'v1', using: :path
    format :json
    prefix :api

    rescue_from JWT::DecodeError do
      error!(error: { code:401, message: 'invalid token' })
    end

    rescue_from Grape::Exceptions::MethodNotAllowed do
      error!(error: { code: 405, message: 'not allowed' })
    end

    rescue_from Grape::Exceptions::ValidationErrors do |e|
      error!(error: { code: 400, message: e.message })
    end

    mount RailsTask::V1::Albums
    mount RailsTask::V1::Photos
    mount RailsTask::V1::Login
  end
end
