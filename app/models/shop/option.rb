class Shop::Option
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::ForbiddenAttributesProtection

  field :name, type: String
  field :values, type: Array

  validates :name, length: {minimum: 3}
  validates :values, length: {minimum: 1}

  rails_admin do
    list do
      exclude_fields :_type, :_id, :created_at, :updated_at
    end
  end
end
