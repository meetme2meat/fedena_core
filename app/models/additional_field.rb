

class AdditionalField < ActiveRecord::Base
  validates_presence_of :name
  validates_format_of     :name, :with => /^[a-z ][a-z0-9 ]*$/i,
    :message => "#{t('must_contain_only_letters_numbers_space')}"
end
