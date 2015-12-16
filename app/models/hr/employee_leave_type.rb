

class EmployeeLeaveType < ActiveRecord::Base
    has_many :employee_leaves
    has_many :employee_attendances

    validates_presence_of :name, :code
    validates_uniqueness_of :name, :code
    validates_numericality_of :max_leave_count, :greater_than => 0
end
