# frozen_string_literal: true

class Todo < Hanami::Entity
  attributes do
    attribute :id, Types::Int
    attribute :user_id, Types::Int
    attribute :title, Types::String
    attribute :progress, Types::Int
  end
end
