class CreateMeds < ActiveRecord::Migration
  def change
    create_table :meds do |t|
      t.string :title, null: false
      t.string :directions, null: false
      t.string :comments

      t.timestamps null: false
    end
  end
end
