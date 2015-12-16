

class News < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'
  has_many :comments, :class_name => 'NewsComment'
  after_save :reload_news_bar
  after_destroy :reload_news_bar

  validates_presence_of :title, :content

  default_scope :order => 'created_at DESC'

  cattr_reader :per_page
  xss_terminate :except => [:content]
  @@per_page = 12

  def self.get_latest
      News.find(:all, :limit => 3)
  end

  def reload_news_bar
    ActionController::Base.new.expire_fragment(News.cache_fragment_name)
  end

  def self.cache_fragment_name
    'News_latest_fragment'
  end
  
end