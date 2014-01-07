class GroupUser<ActiveRecord::Base
  validates_presence_of :user

  belongs_to :group,
    inverse_of: :group_users

  belongs_to :user,
    inverse_of: :group_users
end