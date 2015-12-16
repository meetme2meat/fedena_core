

class FinanceFeeParticular < ActiveRecord::Base

  belongs_to :finance_fee_category
  belongs_to :student_category
  validates_presence_of :name,:amount
  validates_numericality_of :amount, :greater_than_or_equal_to => 0, :message => "#{t('must_be_positive')}"
  cattr_reader :per_page
  @@per_page = 10
  
  def deleted_category
    flag = false
    category = self.student_category
    unless category.blank?
      flag = true if category.is_deleted
    end
    return flag
  end

end
