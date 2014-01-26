module GroupHelper
  def create_group
    fill_in 'group_name', with: "GroupTest"
    click_on "Make Group"
  end
end

