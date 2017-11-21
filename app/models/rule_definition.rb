class RuleDefinition < ApplicationRecord
  validates :name, presence: true
  validates :definition_data, presence: true
end
