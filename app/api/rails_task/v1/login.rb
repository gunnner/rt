class RailsTask::V1::Login < Grape::API
  SECRET = ENV.fetch('JWT_SECRET').freeze

  helpers RailsTask::Helpers::Auth

  namespace 'login' do
    desc 'Log in'
    params do
      requires :email, type: String, allow_blank: false, regexp: User::VALID_EMAIL
      requires :password, type: String, allow_blank: false
    end

    post do
      email = params[:email]

      user = User.find_by(email: email)
      invalid_auth_data unless user.present? && user.valid_password?(params[:password])

      if user
        iat = Time.now.to_i
        exp = 24.hours.from_now.to_i
        exp_payload = { user_id: user.id, iat: iat, exp: exp }
        token = JWT.encode(exp_payload, SECRET, 'HS256')

        { token: token }
      else
        invalid_auth_data
      end
    end
  end
end
