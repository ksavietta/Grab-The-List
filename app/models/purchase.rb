class Purchase<ActiveRecord::Base
  validates_presence_of :purchased_at
  validates_presence_of :cost

  validates :cost,
    numericality: {greater_than_or_equal_to: 0}

  has_many :items,
    inverse_of: :purchase,
    dependent: :destroy

  belongs_to :user, inverse_of: :purchases
  belongs_to :group, inverse_of: :purchases
end