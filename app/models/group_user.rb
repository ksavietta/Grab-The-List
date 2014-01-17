class GroupUser<ActiveRecord::Base
  validates_presence_of :user

  belongs_to :group,
    inverse_of: :group_users

  belongs_to :user,
    inverse_of: :group_users

  validates_uniqueness_of :user_id, :scope => :group_id

  def email_address
    self.user.try(:email_address)
  end

  def email_address=(email_address)
    self.user = User.where(email: email_address).first
  end

  def user_exists?
    self.user
  end

  def spent_for_group
    "MONEY THIS PERSON OWES"
    total = 0.00
    self.user.purchases.where(group_id: self.group.id).where(settled_at: nil).each do |unsettled_purchase|
      total += unsettled_purchase.cost
    end
    total
  end



end