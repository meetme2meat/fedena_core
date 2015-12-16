

class EmployeeGrade < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name, :priority
  validates_numericality_of :priority

  has_many :employee
  named_scope :active, :conditions => {:status => true }

  def validate
    self.errors.add(:max_hours_week, "#{t('should_be_greater_than_max_period')}.") \
      if self.max_hours_day > self.max_hours_week \
      unless self.max_hours_day.nil? or self.max_hours_week.nil?
  end
end
