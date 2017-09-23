# frozen_string_literal: true

module Web::Controllers::Todos
  class Create
    include Web::Action
    include Ita::Authentication

    before :authenticate_user!
    before :configure_response
    expose :todo

    params do
      required(:token).filled(:str?)
      required(:todo).schema do
        required(:title).filled(:str?)
      end
    end

    def call(params)
      halt 400 unless params.valid?
      repo = TodoRepository.new
      todo = repo.create(current_user.id, title: params.get(:title), progress: 0.0)
      @todo = todo
    end

    private

    def configure_response
      self.status = 201
    end
  end
end
