class Comment < ActiveRecord::Base
  validates :body,:presence=>true  # not null
  belongs_to :comment,:polymorphic=>true
  has_many :comments
  default_scope order 'created_at desc'
end
