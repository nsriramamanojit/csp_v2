class Role < ActiveRecord::Base
  has_many :assignments
  has_many :users, :through => :assignments

  #validations
  validates :name, :presence => true, :uniqueness => true, :length => {:maximum => 100}
  validates :reference_code, :presence => true, :uniqueness => true, :length => {:maximum => 10}
end
