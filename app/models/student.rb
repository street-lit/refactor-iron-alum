class Student < ActiveRecord::Base
  belongs_to :cohort
  belongs_to :location
  validates_presence_of :f_name, :l_name, :email, :bio, :linked_in, :github, :cohort_id, :location_id
  validates_inclusion_of :employed, :in => [true, false]
end
