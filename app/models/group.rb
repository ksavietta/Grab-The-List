class Group<ActiveRecord::Base
  validates_presence_of :name

 has_many :group_users,
    inverse_of: :group

  has_many :users,
    through: :group_users

end