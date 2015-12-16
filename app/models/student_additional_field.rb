

class StudentAdditionalField < ActiveRecord::Base
  belongs_to :student
  belongs_to :student_additional_detail
  validates_presence_of :name
  validates_uniqueness_of :name,:case_sensitive => false
  validates_format_of     :name, :with => /^[a-z ][a-z0-9 ]*$/i,
    :message => "#{t('must_contain_only_letters_numbers_space')}"
end
