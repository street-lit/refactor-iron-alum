class Location < ActiveRecord::Base
  has_many :cohorts
  has_many :students
  validates_presence_of :city, :state
end
