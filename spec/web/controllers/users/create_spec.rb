# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../../apps/web/controllers/users/create'

describe Web::Controllers::Users::Create do
  let(:action) { Web::Controllers::Users::Create.new }

  context 'is successful cases' do
    let(:params) do
      {
        user: {
          email: 'sample@hogepoge.com',
          password: 'foobar',
          password_confirmation: 'foobar'
        }
      }
    end

    it 'is created' do
      response = action.call(params)
      expect(response[2]).to eq 201
    end
  end
end
