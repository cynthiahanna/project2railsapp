class AddUserRefToMeds < ActiveRecord::Migration
  def change
    add_reference :meds, :user, index: true, foreign_key: true, null: false
  end
end
