class CreateInhabitants < ActiveRecord::Migration
  def change
    create_table :inhabitants do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.integer :age
      t.references :wedding
      t.references :user
      t.timestamps
    end
  end
end
