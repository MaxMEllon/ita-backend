# frozen_string_literal: true

require_relative './serializer'

class EachSerializer < Selializer
  def initialize(list, serializer)
    @list = list
    @serializer = serializer
  end

  def json(opt = {})
    result = base
    root = opt&.fetch(:root, '')
    root.empty? ? result.to_json : { root => result }.to_json
  end

  def hash
    base
  end

  private

  def base
    result = []
    @list.each do |i|
      result.push @serializer.new(i).hash
    end
    result
  end
end
