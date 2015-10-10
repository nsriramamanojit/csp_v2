class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.login_field = 'email'
  end # block optional

  has_many :assignments
  has_many :roles, :through => :assignments

  def role_symbols
    roles.map do |role|
      role.name.underscore.to_sym
    end
  end
end
