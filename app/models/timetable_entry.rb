

class TimetableEntry < ActiveRecord::Base
  belongs_to :timetable
  belongs_to :batch
  belongs_to :class_timing
  belongs_to :subject
  belongs_to :employee
  belongs_to :weekday
  delegate :day_of_week,:to=>:weekday
end