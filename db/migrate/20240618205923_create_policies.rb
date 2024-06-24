class CreatePolicies < ActiveRecord::Migration[6.1]
  def change
    create_table :policies do |t|
      t.string :start_date
      t.string :end_date

      t.timestamps
    end
  end
end
