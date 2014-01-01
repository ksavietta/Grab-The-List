class Item<ActiveRecord::Base
  validates_presence_of :name

  belongs_to :list,
    inverse_of: :items
end