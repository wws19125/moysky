class Theader < ActiveRecord::Base
  has_many :TValues,:dependent => :destroy 
end
