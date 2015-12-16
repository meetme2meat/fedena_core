

class FinanceFee < ActiveRecord::Base
  
  belongs_to :finance_fee_collection ,:foreign_key => 'fee_collection_id'
  has_many   :finance_transactions ,:as=>:finance
  has_many :components, :class_name => 'FinanceFeeComponent', :foreign_key => 'fee_id'
  belongs_to :student


  def check_transaction_done
    unless self.transaction_id.nil?
      return true
    else
      return false
    end
  end

  def former_student
    ArchivedStudent.find_by_former_id(self.student_id)
  end
end
