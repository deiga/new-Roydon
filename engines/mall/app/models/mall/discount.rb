module Mall
  class Discount < PriceModification
    has_many :products
    has_many :categories
    belongs_to :user_group
    belongs_to :promotion

    rails_admin do
      list do
        exclude_fields :_type, :_id, :created_at, :updated_at
      end
    end
  end
end
