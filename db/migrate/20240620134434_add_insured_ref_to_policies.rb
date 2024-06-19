class AddInsuredRefToPolicies < ActiveRecord::Migration[6.1]
  def change
    add_reference :policies, :insured, null: false, foreign_key: true
  end
end
