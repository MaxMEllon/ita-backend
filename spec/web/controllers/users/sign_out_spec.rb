# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../../apps/web/controllers/users/sign_out'

describe Web::Controllers::Users::SignOut do
  let(:action) { Web::Controllers::Users::SignOut.new }

  context 'of success cases' do
    let(:params) { jwt }

    it 'is sign_out' do
      response = action.call(params)
      expect(response[0]).to be 204
    end
  end
end
