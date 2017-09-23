# frozen_string_literal: true

module Web::Views::Todos
  class Create
    include Web::View

    def render
      raw(TodoSerializer.new(todo).send_json)
    end
  end
end
