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

  context 'of failure cases' do
    describe 'token invalid case' do
      let(:params) do
        {
          todo: {
            title: 'sample todo'
          }
        }
      end

      it 'is tried to create a todo' do
        response = action.call(params)
        expect(response[0]).equal? 401
      end
    end

    describe 'todo invalid case' do
      let(:params) do
        {

        }.merge(jwt)
      end

      it 'is tried to create a todo' do
        response = action.call(params)
        expect(response[0]).equal? 400
      end
    end
  end
end
