

class StudentAdditionalDetail < ActiveRecord::Base
  belongs_to :student
  belongs_to :student_additional_field, :foreign_key=>'additional_field_id'
end
