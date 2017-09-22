# frozen_string_literal: true

class BaseSerializer
  class << self
    protected

    def attribute(*syms)
      # rubocop:disable Style/ClassVars
      @@keys ||= []
      syms.each do |sym|
        @@keys.push sym
      end
      # rubocop:enable Style/ClassVars
    end
  end

  def initialize(obj)
    @obj = obj
  end

  def send_json(opt = {})
    result = {}
    @@keys.each do |key|
      value = try_send_key(key)
      result = result.merge(key => value) unless value.nil?
    end
    root = opt&.fetch(:root, '')
    root.empty? ? result.to_json : { root => result }.to_json
  end

  def try_send_key(key)
    if respond_to? key
      send(key)
    else
      begin
        @obj.send(key)
      rescue
        $ERROR_INFO
      end
    end
  end

  protected

  def object
    @obj
  end
end
