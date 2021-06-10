module RailsTask::Helpers::Auth

  def current_user
    return @current_user if @current_user

    token = headers['Authorization']
    return missing_token unless token

    token = token.split.last
    user = user(token)
    return user_not_found unless user

    @current_user = user
  end

  private

  def user(token)
    user_data, = JWT.decode(token, RailsTask::V1::Login::SECRET, true, { algorithm: 'HS256' })
    User.find_by(id: user_data['user_id'])
  end

  def missing_token
    error!(error: {code: 400, message: 'token is missing' })
  end

  def user_not_found
    error!(error: {code: 404, message: 'user not found'})
  end

  def invalid_auth_data
    error!(error: { code: 401, message: 'invalid authentication data' })
  end
end
