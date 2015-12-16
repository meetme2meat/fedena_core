

class Attendance < ActiveRecord::Base
  belongs_to :subject
  belongs_to :student
  belongs_to :batch
  validates_presence_of :reason
  validates_uniqueness_of :student_id, :scope => [:month_date],:message=>"already marked as absent"

  def validate
    errors.add("#{t('attendance_before_the_date_of_admission')}")  if self.month_date < self.student.admission_date
  end
  named_scope :by_month, lambda { |d| { :conditions  => { :month_date  => d.beginning_of_month..d.end_of_month } } }
  named_scope :by_month_and_batch, lambda { |d,b| {:conditions  => { :month_date  => d.beginning_of_month..d.end_of_month,:batch_id=>b } } }
end