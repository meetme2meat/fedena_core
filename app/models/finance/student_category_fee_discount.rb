


class StudentCategoryFeeDiscount < FeeDiscount

belongs_to :receiver ,:class_name=>'StudentCategory'
validates_presence_of  :receiver_id , :message => "#{t('student_category_cant_be_blank')}"

validates_uniqueness_of :name, :scope=>[:finance_fee_category_id, :type]

#validates_uniqueness_of :receiver_id, :scope=>[:type,:finance_fee_category_id],:message=>'Discount already exists for the student category'


  def category_name
    c =StudentCategory.find(self.receiver_id)
    c.name unless c.nil?
  end

  
end
