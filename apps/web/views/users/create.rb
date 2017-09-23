# frozen_string_literal: true

module Web::Views::Users
  class Create
    include Web::View

    def render
      raw(UserSerializer.new(user).json)
    end
  end
end
