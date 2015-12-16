

class Weekday < ActiveRecord::Base
  belongs_to :batch
  has_many :timetable_entries , :dependent=>:destroy
  default_scope :order => 'weekday asc'
  named_scope   :default, :conditions => { :batch_id => nil,:is_deleted=>false}
  named_scope   :for_batch, lambda { |b| { :conditions => { :batch_id => b.to_i,:is_deleted=>false } } }

  def self.weekday_by_day(batch_id)
    days={}
    weekdays = Weekday.find_all_by_batch_id(batch_id)
    if weekdays.empty?
      weekdays = Weekday.default
    end
    days=weekdays.group_by(&:day_of_week)
  end

  def deactivate
    self.update_attribute(:is_deleted,true)
  end

  def self.add_day(batch_id,day)
    unless batch_id==0
      unless Weekday.find_by_batch_id_and_day_of_week(batch_id,day).nil?
        Weekday.find_by_batch_id_and_day_of_week(batch_id,day).update_attributes(:is_deleted=>false,:day_of_week => day)
      else
        w=Weekday.new
        w.day_of_week = day
        w.weekday = day
        w.batch_id = batch_id
        w.is_deleted = false
        w.save
      end
    else
      unless Weekday.find_by_day_of_week(day).nil?
        Weekday.find_by_day_of_week(day).update_attributes(:is_deleted=>false,:day_of_week => day)
      else
        w=Weekday.new
        w.day_of_week = day
        w.weekday = day
        w.is_deleted = false
        w.save
      end
    end
  end
end
