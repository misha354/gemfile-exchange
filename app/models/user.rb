class User < ActiveRecord::Base
  has_secure_password validations: false

  has_many :gemfiles

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 5} 
  validate :update_password_validation, on: :update

  def update_password_validation
    if self.password
        self.errors.add :password, "must be at least 5 characters"
    end
  end

end