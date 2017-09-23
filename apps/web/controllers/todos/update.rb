# frozen_string_literal: true

module Web::Controllers::Todos
  class Update
    include Web::Action
    include Ita::Authentication

    before :authenticate_user!
    before :configure_response
    expose :todo

    params do
      required(:token).filled(:str?)
      required(:todo).schema do
        required(:progress).filled(:int?)
      end
    end

    def call(params)
      halt 400 unless params.valid?
      repo = TodoRepository.new
      todo = repo.find(params[:id])
      if need_update?(todo)
        halt 400 if todo.user_id != current_user.id
        todo = repo.update(todo.id, todo_params)
        @todo = todo
      else
        halt 304
      end
    end

    private

    def configure_response
      self.status = 202
    end

    def need_update?(todo)
      todo.progress != params.get(:todo, :progress)
    end

    def todo_params
      { progress: params.get(:todo, :progress) }
    end
  end
end
