class Shop::ValueAddedTax < Shop::PriceModification

  has_many :products, class_name: 'Shop::Product'

  rails_admin do
    list do
      exclude_fields :_type, :_id, :created_at, :updated_at
    end
  end

end
