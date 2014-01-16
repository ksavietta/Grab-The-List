class Purchase < ActiveRecord::Base
  validates_presence_of :cost
  validates_presence_of :items

  validates :cost,
    numericality: {greater_than_or_equal_to: 0}

  has_many :items,
    inverse_of: :purchase,
    dependent: :destroy

  belongs_to :user, inverse_of: :purchases
  belongs_to :group, inverse_of: :purchases

  mount_uploader :receipt_photo, ReceiptPhotoUploader

  def make_purchase(item_ids)
    if save
      item_ids.each do |item_id|
        if item_id != ""
          item = Item.find(item_id)
          item.purchase_id = self.id
        end
      end
      true
    else
      false
    end
  end

  def formatted_date
    self.created_at.strftime("%m-%d-%Y")
  end

end
