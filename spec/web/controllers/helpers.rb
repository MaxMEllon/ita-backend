module Controllers
  module Helpers
    def create_user
      UserRepository.new.create(
        email: 'sample@foobarhogepoge.com',
        password: Digest::SHA256.hexdigest('foobar'),
        token: SecureRandom.urlsafe_base64(nil, false)
      )
    end
  end
end
