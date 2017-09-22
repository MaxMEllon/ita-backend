module Controllers
  module Helpers
    def create_user(params = {})
      default_params = {
        email: 'sample@foobarhogepoge.com',
        password: Digest::SHA256.hexdigest('foobar'),
        token: SecureRandom.urlsafe_base64(nil, false)
      }
      p = default_params.merge(params)
      UserRepository.new.create(p)
    end

    def jwt
      user = create_user
      JSON.parse(UserSerializer.new(user).send_json)
    end
  end
end
