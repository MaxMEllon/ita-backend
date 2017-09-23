# frozen_string_literal: true

module Web::Views::Todos
  class List
    include Web::View

    def render
      raw(EachSerializer.new(todos, TodoSerializer).json)
    end
  end
end
