class User < ApplicationRecord
    has_secure_password
    has_and_belongs_to_many :permissions

    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email'}

    def has_permission?(permission)
        Current.user.permissions.pluck(:title).include?(permission)
    end
end
