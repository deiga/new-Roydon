class Shop::Discount < Shop::PriceModification
  has_many :products, class_name: 'Shop::Product'
  has_many :categories, class_name: 'Shop::Category'
  belongs_to :user_group, class_name: 'Shop::UserGroup'
  belongs_to :promotion, class_name: 'Shop::Promotion'

  rails_admin do
    list do
      exclude_fields :_type, :_id, :created_at, :updated_at
    end
  end
end
