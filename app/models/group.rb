class Group<ActiveRecord::Base
  validates_presence_of :name

  has_many :group_users,
    inverse_of: :group

  has_many :users,
    through: :group_users

  has_many :items

  has_many :purchases,
    inverse_of: :group,
    dependent: :destroy

end