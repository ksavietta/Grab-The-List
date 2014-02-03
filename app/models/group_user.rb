class GroupUser<ActiveRecord::Base
  validates_presence_of :user

  belongs_to :group,
    inverse_of: :group_users

  belongs_to :user,
    inverse_of: :group_users

  has_many :purchases,
    inverse_of: :group_user

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
    total = 0.00
    self.purchases.where(settled_at: nil).each do |unsettled_purchase|
      total += unsettled_purchase.cost
    end
    total
  end

  def owes_owed
    group_total = self.group.total_spent_unsettled
    individual_share = group_total/self.group.users.count
    owes_owed = individual_share - spent_for_group
  end

  def owes
    owes_owed.round(2) if owes_owed > 0
  end

  def owed
    (owes_owed*-1).round(2) if owes_owed < 0
  end


end