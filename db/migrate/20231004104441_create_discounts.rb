class CreateDiscounts < ActiveRecord::Migration[6.1]
  def change
    create_table :discounts do |t|
      t.integer :amount
      t.references :collection

      t.timestamps
    end
  end
end
