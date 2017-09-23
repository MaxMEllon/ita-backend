# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../../apps/web/controllers/todos/list'

describe Web::Controllers::Todos::List do
  let(:action) { Web::Controllers::Todos::List.new }

  context 'of successful cases' do
    let(:params) { {}.merge(jwt) }

    it 'is got' do
      response = action.call(params)
      expect(response[0]).equal? 200
    end
  end
end
