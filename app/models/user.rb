class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :groups, through: :group_users
  has_many :group_users
  has_many :messages

  scope :not_user, -> (user){ where.not(id: user) }
  scope :incremental_search, -> (name){ where('name LIKE(?)',"%#{name}%") }

  validates :name, presence: true, uniqueness: true

  # allow users to update their accounts without passwords
   def update_without_current_password(params, *options)
     params.delete(:current_password)

     if params[:password].blank? && params[:password_confirmation].blank?
       params.delete(:password)
       params.delete(:password_confirmation)
     end

     result = update_attributes(params, *options)
     clean_up_passwords
     result
   end

end
