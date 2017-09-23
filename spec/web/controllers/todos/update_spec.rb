# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../../apps/web/controllers/todos/update'

describe Web::Controllers::Todos::Update do
  let(:action) { Web::Controllers::Todos::Update.new }

  context 'of successful cases' do
    let(:todo) { create_todo }
    let(:params) do
      {
        id: todo.id,
        todo: {
          title: 'update_todo',
          progress: 0.5
        }
      }
    end

    it 'is updated' do
      response = action.call(params)
      expect(response[0]).equal? 202
    end
  end
end
