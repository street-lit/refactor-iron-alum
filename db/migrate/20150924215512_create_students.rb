class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :f_name, null: false
      t.string :l_name, null: false
      t.string :email, null: false
      t.text :bio, null: false
      t.string :linked_in, null: false
      t.string :github, null: false
      t.boolean :employed, null: false, default: false
      t.string :place_employed
      t.belongs_to :cohort, index: true, foreign_key: true
      t.belongs_to :location, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
