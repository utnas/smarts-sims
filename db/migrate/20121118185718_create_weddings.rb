class CreateWeddings < ActiveRecord::Migration
  def change
    create_table :weddings do |t|
      t.integer :first_spouse_id
      t.integer :second_spouse_id
      t.timestamps
    end
  end
end
