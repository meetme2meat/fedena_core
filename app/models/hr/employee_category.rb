

class EmployeeCategory < ActiveRecord::Base
  validates_presence_of :name, :prefix
  validates_uniqueness_of :name, :prefix
  named_scope :active, :conditions => {:status => true }
  has_many :employee_positions
  has_many :employees
end
