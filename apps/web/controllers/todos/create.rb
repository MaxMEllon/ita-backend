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
      todo = repo.create todo_params
      @todo = todo
    end

    private

    def configure_response
      self.status = 201
    end

    def todo_params
      {
        user_id: current_user.id,
        title: params.get(:todo, :title),
        progress: 0
      }
    end
  end
end
