


class StudentFeeDiscount < FeeDiscount
  
  belongs_to :receiver ,:class_name=>'Student'

  validates_presence_of  :receiver_id , :message => "#{t('student_admission_no_cant_be_blank')}"

  validates_uniqueness_of :name, :scope=>[:finance_fee_category_id, :type, :receiver_id ]

#  validates_uniqueness_of :receiver_id, :scope=>[:type,:finance_fee_category_id],:message=>'Discount already exists for the student'

 

end
