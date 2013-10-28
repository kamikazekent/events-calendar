class User < ActiveRecord::Base

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :extension, uniqueness: true, length: { is: 5 }
  validates :username, presence: true, uniqueness: true

end
