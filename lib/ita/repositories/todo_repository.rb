# frozen_string_literal: true

class TodoRepository < Hanami::Repository
  def by_user(user_id)
    todos.where(user_id: user_id)
  end
end
