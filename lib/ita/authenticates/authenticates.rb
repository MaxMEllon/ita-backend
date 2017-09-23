# frozen_string_literal: true

module Ita::Authentication
  def current_user
    @current_user ||= authenticate_user
  end

  def authenticate_user!
    id, token = JWT.decode(params.get(:token), nil, false)[0].values_at('id', 'token')
    user = UserRepository.new.find(id)
    halt 401 unless user.token == token
    if user
      @current_user = user
      @current_user
    end
  rescue JWT::DecodeError => _
    halt 401
  end
end
