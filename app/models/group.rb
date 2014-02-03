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
    through: :group_users,
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

  def total_spent_unsettled
    total =0.00
    self.purchases.where(settled_at: nil).each do |purchase|
      total += purchase.cost
    end
    total
  end

end