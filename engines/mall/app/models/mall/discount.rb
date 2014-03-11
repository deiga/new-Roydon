module Mall
  class Discount < PriceModification
    has_many :products, class_name: 'Product'
    has_many :categories, class_name: 'Category'
    belongs_to :user_group, class_name: 'UserGroup'
    belongs_to :promotion, class_name: 'Promotion'

    rails_admin do
      list do
        exclude_fields :_type, :_id, :created_at, :updated_at
      end
    end
  end
end
