class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.string :name, null: false
      t.string :period_type
      t.date :period_start
      t.date :period_end
      t.string :status
      t.integer :created_by_id
      t.integer :updated_by_id
      t.decimal :total_hours
      t.string :contract_number

      t.timestamps
    end

    add_index :reports, :created_by_id
    add_index :reports, :updated_by_id
    add_index :reports, :status
    add_index :reports, :period_type
    add_index :reports, :contract_number
  end
end