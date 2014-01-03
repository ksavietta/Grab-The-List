class List<ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :state

  has_many :items,
    inverse_of: :list,
    dependent: :destroy

  validates :price,
    format: {with: /\A\d+(\.\d{1,2})?\z/, allow_nil: true},
    numericality:true, allow_nil:true
end