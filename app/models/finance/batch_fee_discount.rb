


class BatchFeeDiscount < FeeDiscount

  belongs_to :receiver ,:class_name=>'Batch'
  validates_presence_of  :receiver_id , :message => "#{t('batch_cant_be_blank')}"

  validates_uniqueness_of :name, :scope=>[:receiver_id, :type]

#  validates_uniqueness_of :receiver_id, :scope=>[:type,:finance_fee_category_id],:message=>'Discount already exists for batch'
end
