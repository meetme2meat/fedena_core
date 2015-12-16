

class WeekdayController < ApplicationController
  before_filter :login_required
  filter_access_to :all
  def index
    @batches = Batch.active
    @weekdays = Weekday.default
    @day = ["#{t('sunday')}", "#{t('monday')}", "#{t('tuesday')}", "#{t('wednesday')}", "#{t('thursday')}", "#{t('friday')}", "#{t('saturday')}"]
    @days = ["0", "1", "2", "3", "4", "5", "6"]
  end

  def week
    @batch = nil
    @days = ["0", "1", "2", "3", "4", "5", "6"]
    @day = ["#{t('sunday')}", "#{t('monday')}", "#{t('tuesday')}", "#{t('wednesday')}", "#{t('thursday')}", "#{t('friday')}", "#{t('saturday')}"]
    if params[:batch_id] == ''
      @weekdays = Weekday.default
    else
      @weekdays = Weekday.for_batch(params[:batch_id])
      @b  = Batch.find params[:batch_id]
    end
    render :update do |page|
      page.replace_html "weekdays", :partial => "weekdays"
    end
  end

  

  def create
    @day = ["#{t('sunday')}", "#{t('monday')}", "#{t('tuesday')}", "#{t('wednesday')}", "#{t('thursday')}", "#{t('friday')}", "#{t('saturday')}"]
    batch = params[:weekday][:batch_id]
    if request.post?
      new_weekdays = params[:weekdays]||[]
      batch = params[:weekday][:batch_id].empty??  nil :params[:weekday][:batch_id]
      old = Weekday.find(:all,:conditions=>{:batch_id=>batch,:is_deleted=>false})
      batch_id = params[:weekday][:batch_id].empty??  0 :params[:weekday][:batch_id]
      old_weekdays = old.map{|w| w.weekday}
      flash[:notice]  = ""
      (new_weekdays-old_weekdays).each do |new|
        Weekday.add_day(batch_id, new)
      end
      (old_weekdays-new_weekdays).each do |week|
        weekday = Weekday.find_by_weekday(week.to_s,:conditions=>{:batch_id=>batch})
        weekday.deactivate
      end
      flash[:notice] = "#{t('weekdays_modified')}"
    end
    redirect_to :action => "index"
  end
end
