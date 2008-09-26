class Article < ActiveRecord::Base
  validates_presence_of :title,:description,:author
end
