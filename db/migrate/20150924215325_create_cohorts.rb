class CreateCohorts < ActiveRecord::Migration
  def change
    create_table :cohorts do |t|
      t.string :course_name, null: false
      t.belongs_to :location, index: true, foreign_key: true
      t.date :start_date, null: false
      t.date :end_date, null:false
      t.timestamps null: false
    end
  end
end
