

class FinanceDonation < ActiveRecord::Base
  belongs_to :transaction, :class_name => 'FinanceTransaction',  :dependent => :destroy
  validates_presence_of :donor, :amount
  validates_numericality_of :amount, :greater_than_or_equal_to => 0, :message => "#{t('must_be_positive')}"

  before_create :create_finance_transaction

  def create_finance_transaction
    transaction = FinanceTransaction.create(
      :title => "#{t('donation_from')}" + donor,
      :description => description,
      :amount => amount,
      :transaction_date => transaction_date,
      :category => FinanceTransactionCategory.find_by_name('Donation')
    )
    self.transaction_id = transaction.id
  end
end
