# frozen_string_literal: true

class TodoSerializer < BaseSerializer
  attribute :id, :title, :progress
end
