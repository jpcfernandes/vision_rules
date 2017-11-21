require 'rails_helper'

describe RuleDefinition do
  describe 'name attribute' do
    it 'is required' do
      expect(RuleDefinition).to require_presence_of :name
    end
  end

  describe 'definition_data attribute' do
    it 'is required' do
      expect(RuleDefinition).to require_presence_of :definition_data
    end
  end
end
