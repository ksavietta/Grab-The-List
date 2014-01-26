module ItemsHelper
  def add_two_items
    fill_in 'item_name', with: "Eggs"
    click_on 'add-item-button'
    fill_in 'item_name', with: "Milk"
    click_on 'add-item-button'
  end
end

