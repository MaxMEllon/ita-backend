# frozen_string_literal: true

module Controllers
  module Helpers
    def create_user(params = {})
      default_params = {
        email: 'sample@foobarhogepoge.com',
        password: Digest::SHA256.hexdigest('foobar'),
        token: SecureRandom.urlsafe_base64(nil, false)
      }
      p = default_params.merge params
      UserRepository.new.create(p)
    end

    def create_todo(params = {})
      create_user
      user = UserRepository.new.all.last
      default_params = {
        user_id: user.id,
        title: 'foobar',
        progress: 'hogepoge'
      }
      p = default_params.merge params
      todo = TodoRepository.new.create(p)
      todo
    end

    def jwt
      user = create_user
      JSON.parse(UserSerializer.new(user).json)
    end
  end
end
