class User < ActiveRecord::Base
  validates_presence_of :first_name
  validates_presence_of :last_name
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def is_admin?
    role == 'admin'
  end

  has_many :group_users,
    inverse_of: :user

  has_many :groups,
    through: :group_users

end
