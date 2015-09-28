class Cohort < ActiveRecord::Base
  belongs_to :location
  has_many :students
end
