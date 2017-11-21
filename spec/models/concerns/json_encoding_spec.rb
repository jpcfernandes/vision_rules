require 'rails_helper'

describe JsonEncoding do
  let :example_class do
    Class.new do
      include JsonEncoding
      attr_accessor :some_attribute
      json_encode :some_attribute
    end
  end

  describe 'json_encode' do
    it 'creates a reader method that returns the result of decoding target attribute value' do
      object = example_class.new
      object.some_attribute = {'some' => 'data'}.to_json

      expect(object.some_attribute_hash).to eq({'some' => 'data'})
    end

    it 'creates a writer method that encodes given value as JSON and assigns that to target attribute' do
      object = example_class.new
      object.some_attribute_hash = {'some' => 'data'}

      expect(object.some_attribute).to eq({'some' => 'data'}.to_json)
    end

    it 'allows customizing reader/writer methods by using :as option' do
      another_example_class = Class.new(example_class) do
        attr_accessor :some_other_attribute
        json_encode :some_other_attribute, as: 'target'
      end

      object = another_example_class.new

      object.target = {'some' => 'data'}
      expect(object.some_other_attribute).to eq({'some' => 'data'}.to_json)

      object.some_other_attribute = {'some' => {'other' => 'data'}}.to_json
      expect(object.target).to eq({'some' => {'other' => 'data'}})
    end
  end
end
