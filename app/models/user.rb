class User < ActiveRecord::Base
  validates_with UserValidator
end
