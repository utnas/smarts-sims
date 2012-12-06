class CreateDivorces < ActiveRecord::Migration
  def change
    create_table :divorces do |t|
      t.integer :first_person_id
      t.integer :second_person_id
      t.timestamps
    end
  end
end
