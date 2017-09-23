# frozen_string_literal: true

module Web::Controllers::Todos
  class List
    include Web::Action
    include Ita::Authentication

    before :authenticate_user!
    before :configure_response
    expose :todos

    params do
      required(:token).filled(:str?)
    end

    def call(_params)
      @todos = TodoRepository.new.by_user(current_user.id)
    end

    private

    def configure_response
      self.status = 200
    end
  end
end
