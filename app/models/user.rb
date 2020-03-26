class User < ActiveRecord::Base
    has_secure_password
    has_many :pizzas

    validates :user_name, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true

end
