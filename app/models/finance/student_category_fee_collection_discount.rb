


class StudentCategoryFeeCollectionDiscount < FeeCollectionDiscount

  belongs_to :receiver ,:class_name=>'StudentCategory'
  validates_presence_of  :receiver_id , :message => "#{t('student_category_cant_be_blank')}"

  
end
