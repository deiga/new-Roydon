module Mall
  class ValueAddedTax < PriceModification

    has_many :products

    rails_admin do
      list do
        exclude_fields :_type, :_id, :created_at, :updated_at
      end
    end

  end
end
