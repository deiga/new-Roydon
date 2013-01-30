class Address
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :city, type: String
  field :postal, type: String
  field :country, type: String
  field :street, type: String
  field :telephone, type: String
  field :description, type: String
end
