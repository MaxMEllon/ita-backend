# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../../apps/web/controllers/todos/create'

RSpec.describe Web::Controllers::Todos::Create do
  let(:action) { described_class.new }

  context 'of successful cases' do
    let(:params) do
      {
        todo: {
          title: 'sample todo'
        }
      }.merge(jwt)
    end

    it 'is created' do
      response = action.call(params)
      expect(response[0]).equal? 201
    end
  end
end
