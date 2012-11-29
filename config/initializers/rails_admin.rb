# encoding: UTF-8
# RailsAdmin config file. Generated on February 20, 2012 04:43
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|

  # If your default_local is different from :en, uncomment the following 2 lines and set your default locale here:
  require 'i18n'
  I18n.default_locale = :fi

  config.current_user_method { current_user.admin? } # auto-generated

  # If you want to track changes on your models:
  # config.audit_with :history, User

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, User

  # Set the admin name here (optional second array element will appear in a beautiful RailsAdmin red ©)
  # config.main_app_name = ['Roydon', 'Admin']
  # or for a dynamic name:
  config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }


  #  ==> Global show view settings
  # Display empty fields in show views
  # config.compact_show_view = false

  #  ==> Global list view settings
  # Number of default rows per-page:
  # config.default_items_per_page = 20

  #  ==> Included models
  # Add all excluded models here:
  # config.excluded_models = [Show, Story, User]

  # Add models here if you want to go 'whitelist mode':
  # config.included_models = [Show, Story, User]

  # Application wide tried label methods for models' instances
  # config.label_methods << :description # Default is [:name, :title]

  #  ==> Global models configuration
  # config.models do
  #   # Configuration here will affect all included models in all scopes, handle with care!
  #
  #   list do
  #     # Configuration here will affect all included models in list sections (same for show, export, edit, update, create)
  #
  #     fields_of_type :date do
  #       # Configuration here will affect all date fields, in the list section, for all included models. See README for a comprehensive type list.
  #     end
  #   end
  # end
  #
  #  ==> Model specific configuration
  # Keep in mind that *all* configuration blocks are optional.
  # RailsAdmin will try his best to provide the best defaults for each section, for each field.
  # Try to override as few things as possible, in the most generic way. Try to avoid setting labels for models and attributes, use ActiveRecord I18n API instead.
  # Less code is better code!
  # config.model MyModel do
  #   # Cross-section field configuration
  #   object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #   label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #   label_plural 'My models'      # Same, plural
  #   weight -1                     # Navigation priority. Bigger is higher.
  #   parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #   navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  #   # Section specific configuration:
  #   list do
  #     filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #     items_per_page 100    # Override default_items_per_page
  #     sort_by :id           # Sort column (default is primary key)
  #     sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     # Here goes the fields configuration for the list view
  #   end
  # end

  # Your model's configuration, to help you get started:

  # All fields marked as 'hidden' won't be shown anywhere in the rails_admin unless you mark them as visible. (visible(true))

  config.model Show do
    # Found associations:
    # Found columns:
      # configure :_type, :mongoid_type         # Hidden
      # configure :_id, :bson_object_id         # Hidden
      # configure :title, :string
      # configure :url, :string
      # configure :location, :string
      # configure :duration, :integer
      # configure :date, :date
      # configure :created_at, :datetime
      # configure :updated_at, :datetime
    # Sections:
    list do
      exclude_fields :_type, :_id, :created_at, :updated_at
    end
      # export do; end
      # show do; end
      # edit do; end
      # create do; end
      # update do; end
    end
    config.model Story do
    # Found associations:
    # Found columns:
    #     configure :_type, :mongoid_type         # Hidden
    #     configure :_id, :bson_object_id         # Hidden
    #     configure :created_at, :datetime
    #     configure :updated_at, :datetime
    #     configure :title, :string
    #     configure :date, :date
    configure :content, :text
    # Sections:
    list do
      exclude_fields :_type, :_id, :created_at, :updated_at
    end
    #   export do; end
    #   show do; end
    edit do
      field :title, :string
      field :date, :date
      field :content, :text do
        bootstrap_wysihtml5 true
      end
    end
    #   create do; end
    #   update do; end
  end
  config.model Shop::CartItem do
  #   # Found associations:
  #     configure :cart, :belongs_to_association
  #     configure :product, :belongs_to_association
  #   # Found columns:
  #     configure :_type, :text         # Hidden
  #     configure :_id, :bson_object_id
  #     configure :created_at, :datetime
  #     configure :updated_at, :datetime
  #     configure :cart_id, :bson_object_id         # Hidden
  #     configure :product_id, :bson_object_id         # Hidden
  #     configure :quantity, :integer
      # Sections:
      list do
        exclude_fields :_type, :_id, :created_at, :updated_at
      end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
end
config.model Shop::Category do
  # Found associations:
  #     configure :products, :has_and_belongs_to_many_association
  # Found columns:
  #     configure :_type, :text         # Hidden
  #     configure :_id, :bson_object_id
  #     configure :created_at, :datetime
  #     configure :updated_at, :datetime
  configure :ancestry, :enum do
    label 'Parent'
    enum do
      Shop::Category.where(:id.ne => bindings[:object].id).map { |c| [c.name, c.id]}
    end
  end
  #     configure :product_ids, :serialized         # Hidden
  #     configure :name, :string
  #     configure :passive, :boolean
  #     configure :permalink, :text
  # Sections:
  list do
    exclude_fields :_type, :_id, :created_at, :updated_at, :products
  end
  #   export do; end
  #   show do; end
  edit do
    field :name
    field :ancestry
    field :products
    field :passive
    exclude_fields :permalink
  end
  #   create do; end
  #   update do; end
end
config.model Shop::PriceModification do
  #   # Found associations:
  #     configure :products, :has_many_association
  #   # Found columns:
  #     configure :_type, :text         # Hidden
  #     configure :_id, :bson_object_id
  #     configure :created_at, :datetime
  #     configure :updated_at, :datetime
  #     configure :name, :string
  #     configure :discount, :float
  #     configure :user_group_id, :bson_object_id         # Hidden
  #     configure :promotion_id, :bson_object_id         # Hidden
  #   # Sections:
  list do
    exclude_fields :_type, :_id, :created_at, :updated_at
  end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
end
config.model Shop::ValueAddedTax do
  #   # Found associations:
  #     configure :products, :has_many_association
  #   # Found columns:
  #     configure :_type, :text         # Hidden
  #     configure :_id, :bson_object_id
  #     configure :created_at, :datetime
  #     configure :updated_at, :datetime
  #     configure :name, :string
  #     configure :discount, :float
  #     configure :user_group_id, :bson_object_id         # Hidden
  #     configure :promotion_id, :bson_object_id         # Hidden
  #   # Sections:
  list do
    exclude_fields :_type, :_id, :created_at, :updated_at
  end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
end
config.model Shop::Discount do
  #   # Found associations:
  #     configure :user_group, :belongs_to_association
  #     configure :promotion, :belongs_to_association
  #     configure :products, :has_many_association
  #     configure :categories, :has_many_association
  #   # Found columns:
  #     configure :_type, :text         # Hidden
  #     configure :_id, :bson_object_id
  #     configure :created_at, :datetime
  #     configure :updated_at, :datetime
  #     configure :name, :string
  #     configure :discount, :float
  #     configure :user_group_id, :bson_object_id         # Hidden
  #     configure :promotion_id, :bson_object_id         # Hidden
  #   # Sections:
  list do
    exclude_fields :_type, :_id, :created_at, :updated_at
  end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
end
config.model Shop::GroupDiscount do
  #   # Found associations:
  #     configure :user, :belongs_to_association
  #     configure :promotion, :belongs_to_association
  #     configure :products, :has_many_association
  #   # Found columns:
  #     configure :_type, :text         # Hidden
  #     configure :_id, :bson_object_id
  #     configure :created_at, :datetime
  #     configure :updated_at, :datetime
  #     configure :name, :string
  #     configure :discount, :float
  #     configure :amount_needed, :integer
  #     configure :user_id, :bson_object_id         # Hidden
  #     configure :promotion_id, :bson_object_id         # Hidden
  #   # Sections:
  list do
    exclude_fields :_type, :_id, :created_at, :updated_at
  end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
end
config.model Shop::Option do
  #   # Found associations:
  #   # Found columns:
  #     configure :_type, :text         # Hidden
  #     configure :_id, :bson_object_id
  #     configure :created_at, :datetime
  #     configure :updated_at, :datetime
  #     configure :product_ids, :serialized         # Hidden
  #     configure :name, :string
  #     configure :values, :serialized
  #   # Sections:
  list do
    exclude_fields :_type, :_id, :created_at, :updated_at
  end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
end
config.model Shop::Order do
  #   # Found associations:
  #     configure :items, :has_many_association
  #   # Found columns:
  #     configure :_type, :text         # Hidden
  #     configure :_id, :bson_object_id
  #     configure :created_at, :datetime
  #     configure :updated_at, :datetime
  #     configure :name, :string
  #     configure :email, :text
  #     configure :address, :text
  #     configure :country, :text
  #     configure :city, :text
  #     configure :postal_number, :text
  #     configure :phone, :text
  #     configure :message, :text
  #     configure :payment, :text
  #   # Sections:
  list do
    exclude_fields :_type, :_id, :created_at, :updated_at
  end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
end

###  Shop::OrderItem  ###

config.model 'Shop::OrderItem' do

#   # You can copy this to a 'rails_admin do ... end' block inside your shop/order_item.rb model definition

#   # Found associations:

#   # Found columns:

#     configure :_type, :text         # Hidden
#     configure :_id, :bson_object_id
#     configure :created_at, :datetime
#     configure :updated_at, :datetime
#     configure :product_id, :bson_object_id
#     configure :product_name, :text
#     configure :product_price, :serialized
#     configure :quantity, :integer
#     configure :options, :serialized
#     configure :tax, :float

#   # Cross-section configuration:

#     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
#     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
#     # label_plural 'My models'      # Same, plural
#     # weight 0                      # Navigation priority. Bigger is higher.
#     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
#     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

#   # Section specific configuration:

#     list do
#       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
#       # items_per_page 100    # Override default_items_per_page
#       # sort_by :id           # Sort column (default is primary key)
#       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
#     end
#     show do; end
#     edit do; end
#     export do; end
#     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
#     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
#     # using `field` instead of `configure` will exclude all other fields and force the ordering
end
config.model Shop::Product do
  #   # Found associations:
  #     configure :categories, :has_and_belongs_to_many_association
  #     configure :options, :has_and_belongs_to_many_association
  #     configure :value_added_tax, :belongs_to_association
  #   # Found columns:
  #     configure :_type, :text         # Hidden
  #     configure :_id, :bson_object_id
  #     configure :created_at, :datetime
  #     configure :updated_at, :datetime
  #     configure :category_ids, :serialized         # Hidden
  #     configure :option_ids, :serialized         # Hidden
  #     configure :value_added_tax_id, :bson_object_id         # Hidden
  #     configure :image_file_name, :text         # Hidden
  #     configure :image_content_type, :text         # Hidden
  #     configure :image_file_size, :integer         # Hidden
  #     configure :image_updated_at, :datetime         # Hidden
  #     configure :image, :paperclip
  #     configure :name, :string
  #     configure :passive, :boolean
  #     configure :suggestion, :boolean
  #     configure :description, :text
  #     configure :price, :decimal
  configure :price, :decimal do
    pretty_value do
      humanized_money value + ' €'
    end
  end
  #     configure :passive, :boolean
  #     configure :suggestion, :boolean
  #     configure :description, :text
  #     configure :image, :text
  #   # Sections:
  list do
    exclude_fields :_type, :_id, :created_at, :updated_at
  end
  #   export do; end
  #   show do; end
  edit do
      field :name, :string
      field :price do
        help 'Example: 35,00'
      end
      field :description, :text do
        bootstrap_wysihtml5 true
      end
      field :image, :paperclip
      field :passive
      field :suggestion
      field :categories
      field :options
      field :value_added_tax
    end
  #   create do; end
  #   update do; end
end
config.model Shop::Promotion do
  #   # Found associations:
  #     configure :discount, :has_one_association
  #   # Found columns:
  #     configure :_type, :text         # Hidden
  #     configure :_id, :bson_object_id
  #     configure :created_at, :datetime
  #     configure :updated_at, :datetime
  #     configure :name, :string
  #     configure :start_date, :datetime
  #     configure :end_date, :datetime
  #     configure :passive, :boolean
  #   # Sections:
  list do
    exclude_fields :_type, :_id, :created_at, :updated_at
  end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
end
config.model Shop::ShoppingCart do
  #   # Found associations:
  #     configure :items, :has_many_association
  #   # Found columns:
  #     configure :_type, :text         # Hidden
  #     configure :_id, :bson_object_id
  #     configure :created_at, :datetime
  #     configure :updated_at, :datetime
  #   # Sections:
  list do
    exclude_fields :_type, :_id, :created_at, :updated_at
  end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
end
config.model Show do
  #   # Found associations:
  #   # Found columns:
  #     configure :_type, :text         # Hidden
  #     configure :_id, :bson_object_id
  #     configure :created_at, :datetime
  #     configure :updated_at, :datetime
  #     configure :title, :string
  #     configure :duration, :integer
  #     configure :date, :date
  #     configure :url, :string
  #     configure :location, :string
  #   # Sections:
  list do
    exclude_fields :_type, :_id, :created_at, :updated_at
    sort_by :date
    sort_reverse true
  end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
end
config.model User do
  #   # Found associations:
  #     configure :user_groups, :has_and_belongs_to_many_association
  #   # Found columns:
  #     configure :_type, :text         # Hidden
  #     configure :_id, :bson_object_id
  #     configure :email, :text
  #     configure :password, :password         # Hidden
  #     configure :password_confirmation, :password         # Hidden
  #     configure :reset_password_token, :text         # Hidden
  #     configure :reset_password_sent_at, :datetime
  #     configure :remember_created_at, :datetime
  #     configure :sign_in_count, :integer
  #     configure :current_sign_in_at, :datetime
  #     configure :last_sign_in_at, :datetime
  #     configure :current_sign_in_ip, :text
  #     configure :last_sign_in_ip, :text
  #     configure :first_name, :text
  #     configure :last_name, :text
  #     configure :user_group_ids, :serialized         # Hidden
  #   # Sections:
  list do
    exclude_fields :_type, :_id, :created_at, :updated_at
  end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
end
config.model Shop::UserGroup do
  #   # Found associations:
  #     configure :users, :has_and_belongs_to_many_association
  #     configure :discounts, :has_many_association
  #   # Found columns:
  #     configure :_type, :text         # Hidden
  #     configure :_id, :bson_object_id
  #     configure :created_at, :datetime
  #     configure :updated_at, :datetime
  #     configure :name, :string
  #     configure :user_ids, :serialized         # Hidden
  #   # Sections:
  list do
    exclude_fields :_type, :_id, :created_at, :updated_at
  end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
end
end
