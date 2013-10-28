class User < ActiveRecord::Base

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :extension, length: { is: 5 }
  validates :username, presence: true

end
