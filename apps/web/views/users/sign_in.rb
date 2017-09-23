# frozen_string_literal: true

module Web::Views::Users
  class SignIn
    include Web::View

    def render
      raw(UserSerializer.new(user).json)
    end
  end
end
