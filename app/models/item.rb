class Item<ActiveRecord::Base
  validates_presence_of :name

  belongs_to :list,
    inverse_of: :items

  belongs_to :group,
    inverse_of: :items

  belongs_to :purchase,
    inverse_of: :items
end