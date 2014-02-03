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

  def default_group
    self.groups.first
  end

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def total_spent_in_current_month
    total = 0
    self.purchases.where(created_at: Time.now.beginning_of_day..Time.now.end_of_day+1.month).each do |purchase|
      total += purchase.cost
    end
    total
  end

  def find_membership(group)
    self.group_users.where(group_id: group.id).first
  end

  has_many :group_users,
    inverse_of: :user

  has_many :groups,
    through: :group_users

  has_many :items,
    through: :groups

  has_many :purchases,
    through: :group_users,
    inverse_of: :user,
    dependent: :destroy
end
