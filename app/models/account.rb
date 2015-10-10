class Account < ActiveRecord::Base
  #validations
  validates :csp_code, :presence => true, :uniqueness => true, :length => {:maximum => 10}

end
