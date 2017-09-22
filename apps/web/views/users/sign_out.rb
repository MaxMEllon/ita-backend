# frozen_string_literal: true

module Web::Views::Users
  class SignOut
    include Web::View

    def render
      raw({ result: 'success' }.to_json)
    end
  end
end
