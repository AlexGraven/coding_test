class User < ActiveRecord::Base
  validates_with UserValidator
  belongs_to :update
end
