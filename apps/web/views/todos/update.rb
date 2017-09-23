# frozen_string_literal: true

module Web::Views::Todos
  class Update
    include Web::View

    def render
      raw(TodoSerializer.new(todo).json)
    end
  end
end
