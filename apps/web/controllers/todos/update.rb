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
        required(:title).maybe(:str?)
        required(:progress) { none? | type?(Float) }
      end
    end

    def call
      halt 400 unless params.valid?
      repo = TodoRepository.new
      if need_update?
        todo = repo.update(params.get(:id), todo_params)
        @todo = todo
      else
        halt 304
      end
    end

    private

    def configure_response
      self.status = 202
    end

    def need_update?
      todo_params.empty?
    end

    def todo_params
      params = {}
      params.marge(title: params.get(:title)) unless params.get(:title).nil?
      params.marge(progress: params.get(:progress)) unless params.get(:progress).nil?
      params
    end
  end
end
