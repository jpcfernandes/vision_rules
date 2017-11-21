class CreateRuleDefinitions < ActiveRecord::Migration[5.1]
  def change
    create_table :rule_definitions do |t|
      t.string :name
      t.string :definition_data
      t.timestamps
    end
  end
end
