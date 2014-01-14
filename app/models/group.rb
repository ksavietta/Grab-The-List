class Group<ActiveRecord::Base
  validates_presence_of :name

  has_many :group_users,
    inverse_of: :group

  has_many :users,
    through: :group_users

  has_many :items,
    inverse_of: :group

  has_many :purchases,
    inverse_of: :group,
    dependent: :destroy

  def ordered_recent_purchases
    self.purchases.order('created_at DESC').limit(10)
  end

  def purchased_items
    self.items.where('purchase_id is NOT NULL')
  end

  def unpurchased_items
    self.items.where('purchase_id is NULL')
  end


end