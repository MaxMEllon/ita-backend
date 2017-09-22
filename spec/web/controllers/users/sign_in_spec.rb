# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../../apps/web/controllers/users/sign_in'

describe Web::Controllers::Users::SignIn do
  let(:action) { Web::Controllers::Users::SignIn.new }

  before do
    create_user
  end

  context 'of successful cases' do
    let(:params) do
      {
        user: {
          email: 'sample@foobarhogepoge.com',
          password: 'foobar'
        }
      }
    end

    it 'is created' do
      response = action.call(params)
      expect(response[0]).to eq 200
    end
  end
end
