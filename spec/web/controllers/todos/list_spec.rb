# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../../apps/web/controllers/todos/list'

describe Web::Controllers::Todos::List do
  let(:action) { Web::Controllers::Todos::List.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
