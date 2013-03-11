# encoding: UTF-8
# RailsAdmin config file. Generated on February 20, 2012 04:43
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|

  ################  Global configuration  ################

  # Set the admin name here (optional second array element will appear in red). For example:
  # config.main_app_name = ['Roydon', 'Admin']
  # or for a more dynamic name:
  config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }

  # RailsAdmin may need a way to know who the current user is]
  config.current_user_method { current_user } # auto-generated
  config.authorize_with do
    redirect_to main_app.root_path unless warden.user.is_admin?
  end

  # If your default_local is different from :en, uncomment the following 2 lines and set your default locale here:
  require 'i18n'
  I18n.default_locale = :fi

  # If you want to track changes on your models:
  # config.audit_with :history, 'User'

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, 'User'

  # Display empty fields in show views:
  # config.compact_show_view = false

  # Number of default rows per-page:
  # config.default_items_per_page = 20

  # Exclude specific models (keep the others):
  # config.excluded_models = ['Shop::CartItem', 'Shop::Category', 'Shop::Discount', 'Shop::GroupDiscount', 'Shop::Option', 'Shop::Order', 'Shop::OrderItem', 'Shop::PriceModification', 'Shop::Product', 'Shop::Promotion', 'Shop::ShoppingCart', 'Shop::UserGroup', 'Shop::ValueAddedTax', 'Show', 'Story', 'User']

  # Include specific models (exclude the others):
  # config.included_models = ['Shop::CartItem', 'Shop::Category', 'Shop::Discount', 'Shop::GroupDiscount', 'Shop::Option', 'Shop::Order', 'Shop::OrderItem', 'Shop::PriceModification', 'Shop::Product', 'Shop::Promotion', 'Shop::ShoppingCart', 'Shop::UserGroup', 'Shop::ValueAddedTax', 'Show', 'Story', 'User']

  # Label methods for model instances:
  # config.label_methods << :description # Default is [:name, :title]

################  Model configuration  ################

  # Each model configuration can alternatively:
  #   - stay here in a `config.model 'ModelName' do ... end` block
  #   - go in the model definition file in a `rails_admin do ... end` block

  # This is your choice to make:
  #   - This initializer is loaded once at startup (modifications will show up when restarting the application) but all RailsAdmin configuration would stay in one place.
  #   - Models are reloaded at each request in development mode (when modified), which may smooth your RailsAdmin development workflow.


  # Now you probably need to tour the wiki a bit: https://github.com/sferik/rails_admin/wiki
  # Anyway, here is how RailsAdmin saw your application's models when you ran the initializer:

  ###  Show  ###

  config.model 'Show' do

    #   # You can copy this to a 'rails_admin do ... end' block inside your show.rb model definition

    #   # Found associations:



    #   # Found columns:

    #     configure :_type, :text         # Hidden
    #     configure :_id, :bson_object_id
    #     configure :created_at, :datetime
    #     configure :updated_at, :datetime
    #     configure :title, :string
    #     configure :url, :text
    #     configure :location, :text
    #     configure :duration, :integer
    #     configure :date, :date
    #     configure :passive, :boolean

    #   # Cross-section configuration:

    #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
    #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
    #     # label_plural 'My models'      # Same, plural
    #     # weight 0                      # Navigation priority. Bigger is higher.
    #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
    #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

      # Section specific configuration:

      list do
        exclude_fields :_type, :_id, :created_at, :updated_at
        sort_by :date
        sort_reverse true
        # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
        # items_per_page 100    # Override default_items_per_page
        # sort_by :id           # Sort column (default is primary key)
        # sort_reverse true     # Sort direction (default is true for primary key, last created first)
      end
    #     show do; end
    #     edit do; end
    #     export do; end
    #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
    #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
    #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


    ###  Story  ###

  config.model 'Story' do

    #   # You can copy this to a 'rails_admin do ... end' block inside your story.rb model definition

    #   # Found associations:



    #   # Found columns:

    #     configure :_type, :text         # Hidden
    #     configure :_id, :bson_object_id
    #     configure :created_at, :datetime
    #     configure :updated_at, :datetime
    #     configure :title, :string
    #     configure :date, :date
    #     configure :content, :text
    #     configure :language, :text
    #     configure :passive, :boolean

    #   # Cross-section configuration:

    #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
    #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
    #     # label_plural 'My models'      # Same, plural
    #     # weight 0                      # Navigation priority. Bigger is higher.
    #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
    #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

      # Section specific configuration:

      list do
        exclude_fields :_type, :_id, :created_at, :updated_at
        # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
        # items_per_page 100    # Override default_items_per_page
        # sort_by :id           # Sort column (default is primary key)
        # sort_reverse true     # Sort direction (default is true for primary key, last created first)
      end
    #     show do; end
      edit do
        field :title, :string
        field :date, :date
        field :content, :text do
          bootstrap_wysihtml5 true
        end
      end
    #     export do; end
    #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
    #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
    #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


    ###  Shop::CartItem  ###

  config.model 'Shop::CartItem' do

    #   # You can copy this to a 'rails_admin do ... end' block inside your shop/cart_item.rb model definition

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
    #     configure :selected_option, :serialized
    #     configure :quantity, :integer
    #     configure :single_price, :serialized

    #   # Cross-section configuration:

    #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
    #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
    #     # label_plural 'My models'      # Same, plural
    #     # weight 0                      # Navigation priority. Bigger is higher.
    #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
    #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

    #   # Section specific configuration:

    list do
      exclude_fields :_type, :_id, :created_at, :updated_at
      # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
      # items_per_page 100    # Override default_items_per_page
      # sort_by :id           # Sort column (default is primary key)
      # sort_reverse true     # Sort direction (default is true for primary key, last created first)
    end
    #     show do; end
    #     edit do; end
    #     export do; end
    #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
    #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
    #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


    ###  Shop::Category  ###

  config.model 'Shop::Category' do

    #   # You can copy this to a 'rails_admin do ... end' block inside your shop/category.rb model definition

    #   # Found associations:

    #     configure :products, :has_and_belongs_to_many_association

      # Found columns:

    #     configure :_type, :text         # Hidden
    #     configure :_id, :bson_object_id
    #     configure :created_at, :datetime
    #     configure :updated_at, :datetime
    #     configure :product_ids, :serialized         # Hidden
    #     configure :name, :string
    #     configure :passive, :boolean
    #     configure :permalink, :text
        configure :ancestry, :enum do
          label 'Parent'
          enum do
            Shop::Category.where(:id.ne => bindings[:object].id).map { |c| [c.name, c.id]}
          end
        end

    #   # Cross-section configuration:

    #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
    #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
    #     # label_plural 'My models'      # Same, plural
    #     # weight 0                      # Navigation priority. Bigger is higher.
    #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
    #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

      # Section specific configuration:

        list do
          exclude_fields :_type, :_id, :created_at, :updated_at, :products
          # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
          # items_per_page 100    # Override default_items_per_page
          # sort_by :id           # Sort column (default is primary key)
          # sort_reverse true     # Sort direction (default is true for primary key, last created first)
        end
    #     show do; end
        edit do
          field :name
          field :ancestry
          field :products
          field :passive
          exclude_fields :permalink
        end
    #     export do; end
    #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
    #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
    #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


    ###  Shop::PriceModification  ###

  config.model 'Shop::PriceModification' do

    #   # You can copy this to a 'rails_admin do ... end' block inside your shop/price_modification.rb model definition

    #   # Found associations:



    #   # Found columns:

    #     configure :_type, :text         # Hidden
    #     configure :_id, :bson_object_id
    #     configure :created_at, :datetime
    #     configure :updated_at, :datetime
    #     configure :name, :string
    #     configure :value, :float

    #   # Cross-section configuration:

    #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
    #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
    #     # label_plural 'My models'      # Same, plural
    #     # weight 0                      # Navigation priority. Bigger is higher.
    #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
    #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

    #   # Section specific configuration:

    list do
      exclude_fields :_type, :_id, :created_at, :updated_at
          # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
          # items_per_page 100    # Override default_items_per_page
          # sort_by :id           # Sort column (default is primary key)
          # sort_reverse true     # Sort direction (default is true for primary key, last created first)
        end
    #     show do; end
    #     edit do; end
    #     export do; end
    #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
    #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
    #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end

    ###  Shop::ValueAddedTax  ###

  config.model 'Shop::ValueAddedTax' do

    #   # You can copy this to a 'rails_admin do ... end' block inside your shop/value_added_tax.rb model definition

    #   # Found associations:

    #     configure :products, :has_many_association

    #   # Found columns:

    #     configure :_type, :text         # Hidden
    #     configure :_id, :bson_object_id
    #     configure :created_at, :datetime
    #     configure :updated_at, :datetime
    #     configure :name, :string
    #     configure :value, :float

    #   # Cross-section configuration:

    #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
    #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
    #     # label_plural 'My models'      # Same, plural
    #     # weight 0                      # Navigation priority. Bigger is higher.
    #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
    #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

    #   # Section specific configuration:

    list do
      exclude_fields :_type, :_id, :created_at, :updated_at
          # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
          # items_per_page 100    # Override default_items_per_page
          # sort_by :id           # Sort column (default is primary key)
          # sort_reverse true     # Sort direction (default is true for primary key, last created first)
        end
    #     show do; end
    #     edit do; end
    #     export do; end
    #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
    #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
    #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end

  ###  Shop::Discount  ###

  config.model 'Shop::Discount' do

    #   # You can copy this to a 'rails_admin do ... end' block inside your shop/discount.rb model definition

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
    #     configure :value, :float
    #     configure :user_group_id, :bson_object_id         # Hidden
    #     configure :promotion_id, :bson_object_id         # Hidden

    #   # Cross-section configuration:

    #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
    #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
    #     # label_plural 'My models'      # Same, plural
    #     # weight 0                      # Navigation priority. Bigger is higher.
    #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
    #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

    #   # Section specific configuration:

    list do
      exclude_fields :_type, :_id, :created_at, :updated_at
          # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
          # items_per_page 100    # Override default_items_per_page
          # sort_by :id           # Sort column (default is primary key)
          # sort_reverse true     # Sort direction (default is true for primary key, last created first)
        end
    #     show do; end
    #     edit do; end
    #     export do; end
    #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
    #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
    #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end
    ###  Shop::GroupDiscount  ###

  config.model 'Shop::GroupDiscount' do

    #   # You can copy this to a 'rails_admin do ... end' block inside your shop/group_discount.rb model definition

    #   # Found associations:

    #     configure :user_group, :belongs_to_association
    #     configure :promotion, :belongs_to_association
    #     configure :user, :belongs_to_association
    #     configure :products, :has_many_association
    #     configure :categories, :has_many_association

    #   # Found columns:

    #     configure :_type, :text         # Hidden
    #     configure :_id, :bson_object_id
    #     configure :created_at, :datetime
    #     configure :updated_at, :datetime
    #     configure :name, :string
    #     configure :value, :float
    #     configure :user_group_id, :bson_object_id         # Hidden
    #     configure :promotion_id, :bson_object_id         # Hidden
    #     configure :amount_needed, :integer
    #     configure :user_id, :bson_object_id         # Hidden

    #   # Cross-section configuration:

    #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
    #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
    #     # label_plural 'My models'      # Same, plural
    #     # weight 0                      # Navigation priority. Bigger is higher.
    #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
    #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

    #   # Section specific configuration:

    list do
      exclude_fields :_type, :_id, :created_at, :updated_at
          # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
          # items_per_page 100    # Override default_items_per_page
          # sort_by :id           # Sort column (default is primary key)
          # sort_reverse true     # Sort direction (default is true for primary key, last created first)
        end
    #     show do; end
    #     edit do; end
    #     export do; end
    #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
    #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
    #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end
    ###  Shop::Option  ###

  config.model 'Shop::Option' do

    #   # You can copy this to a 'rails_admin do ... end' block inside your shop/option.rb model definition

    #   # Found associations:



    #   # Found columns:

    #     configure :_type, :text         # Hidden
    #     configure :_id, :bson_object_id
    #     configure :created_at, :datetime
    #     configure :updated_at, :datetime
    #     configure :name, :string
    #     configure :values, :serialized

    #   # Cross-section configuration:

    #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
    #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
    #     # label_plural 'My models'      # Same, plural
    #     # weight 0                      # Navigation priority. Bigger is higher.
    #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
    #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

    #   # Section specific configuration:

    list do
      exclude_fields :_type, :_id, :created_at, :updated_at
          # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
          # items_per_page 100    # Override default_items_per_page
          # sort_by :id           # Sort column (default is primary key)
          # sort_reverse true     # Sort direction (default is true for primary key, last created first)
        end
    #     show do; end
    #     edit do; end
    #     export do; end
    #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
    #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
    #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


    ###  Shop::Order  ###

  config.model 'Shop::Order' do

      # You can copy this to a 'rails_admin do ... end' block inside your shop/order.rb model definition

      # Found associations:

      #   configure :items, :has_many_association

      # Found columns:

      #   configure :_type, :text         # Hidden
      #   configure :_id, :bson_object_id
      #   configure :created_at, :datetime
      #   configure :updated_at, :datetime
      #   configure :name, :string
      #   configure :email, :text
      #   configure :address, :text
      #   configure :country, :text
      #   configure :city, :text
      #   configure :postal_number, :text
      #   configure :phone, :text
      #   configure :message, :text
      #   configure :payment, :text
      configure :price, :decimal do
        pretty_value do
          humanized_money value + ' €'
        end
      end
      configure :untaxed_price, :decimal do
        pretty_value do
          humanized_money value + ' €'
        end
      end

      # Cross-section configuration:

        # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
        # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
        # label_plural 'My models'      # Same, plural
        # weight 0                      # Navigation priority. Bigger is higher.
        # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
        # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

      # Section specific configuration:

      list do
        exclude_fields :_type, :_id, :created_at, :updated_at
        # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
        # items_per_page 100    # Override default_items_per_page
        # sort_by :id           # Sort column (default is primary key)
        # sort_reverse true     # Sort direction (default is true for primary key, last created first)
      end
      # show do; end
      # edit do; end
      # export do; end
      # # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
      # # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
      # # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


  ###  Shop::OrderItem  ###

  config.model 'Shop::OrderItem' do

    # You can copy this to a 'rails_admin do ... end' block inside your shop/order_item.rb model definition

    # Found associations:

    # Found columns:

      # configure :_type, :text         # Hidden
      # configure :_id, :bson_object_id
      # configure :created_at, :datetime
      # configure :updated_at, :datetime
      # configure :product_id, :bson_object_id
      # configure :product_name, :text
      # configure :product_price, :serialized
      # configure :quantity, :integer
      # configure :options, :serialized
      # configure :tax, :float

    # Cross-section configuration:

      # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
      # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
      # label_plural 'My models'      # Same, plural
      # weight 0                      # Navigation priority. Bigger is higher.
      # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
      # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

    # Section specific configuration:

      # list do
      #   # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
      #   # items_per_page 100    # Override default_items_per_page
      #   # sort_by :id           # Sort column (default is primary key)
      #   # sort_reverse true     # Sort direction (default is true for primary key, last created first)
      # end
      # show do; end
      # edit do; end
      # export do; end
      # # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
      # # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
      # # using `field` instead of `configure` will exclude all other fields and force the ordering
  end

  ###  Shop::Product  ###

  config.model 'Shop::Product' do

    #   # You can copy this to a 'rails_admin do ... end' block inside your shop/product.rb model definition

    #   # Found associations:

    #     configure :categories, :has_and_belongs_to_many_association
    #     configure :options, :has_and_belongs_to_many_association
    #     configure :value_added_tax, :belongs_to_association

      # Found columns:

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
    configure :price, :decimal do
      pretty_value do
        humanized_money value + ' €'
      end
    end

    #   # Cross-section configuration:

    #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
    #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
    #     # label_plural 'My models'      # Same, plural
    #     # weight 0                      # Navigation priority. Bigger is higher.
    #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
    #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

    #   # Section specific configuration:

    list do
      exclude_fields :_type, :_id, :created_at, :updated_at
          # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
          # items_per_page 100    # Override default_items_per_page
          # sort_by :id           # Sort column (default is primary key)
          # sort_reverse true     # Sort direction (default is true for primary key, last created first)
        end
    #     show do; end
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
    #     export do; end
    #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
    #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
    #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


    ###  Shop::Promotion  ###

  config.model 'Shop::Promotion' do

    #   # You can copy this to a 'rails_admin do ... end' block inside your shop/promotion.rb model definition

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

    #   # Cross-section configuration:

    #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
    #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
    #     # label_plural 'My models'      # Same, plural
    #     # weight 0                      # Navigation priority. Bigger is higher.
    #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
    #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

    #   # Section specific configuration:

    list do
      exclude_fields :_type, :_id, :created_at, :updated_at
          # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
          # items_per_page 100    # Override default_items_per_page
          # sort_by :id           # Sort column (default is primary key)
          # sort_reverse true     # Sort direction (default is true for primary key, last created first)
        end
    #     show do; end
    #     edit do; end
    #     export do; end
    #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
    #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
    #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


  ###  Shop::ShoppingCart  ###

  config.model 'Shop::ShoppingCart' do

    #   # You can copy this to a 'rails_admin do ... end' block inside your shop/shopping_cart.rb model definition

    #   # Found associations:

    #     configure :items, :has_many_association

    #   # Found columns:

    #     configure :_type, :text         # Hidden
    #     configure :_id, :bson_object_id
    #     configure :created_at, :datetime
    #     configure :updated_at, :datetime

    #   # Cross-section configuration:

    #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
    #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
    #     # label_plural 'My models'      # Same, plural
    #     # weight 0                      # Navigation priority. Bigger is higher.
    #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
    #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

    #   # Section specific configuration:

    list do
      exclude_fields :_type, :_id, :created_at, :updated_at
          # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
          # items_per_page 100    # Override default_items_per_page
          # sort_by :id           # Sort column (default is primary key)
          # sort_reverse true     # Sort direction (default is true for primary key, last created first)
        end
    #     show do; end
    #     edit do; end
    #     export do; end
    #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
    #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
    #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


  ###  User  ###

  config.model 'User' do

    #   # You can copy this to a 'rails_admin do ... end' block inside your user.rb model definition

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

    #   # Cross-section configuration:

    #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
    #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
    #     # label_plural 'My models'      # Same, plural
    #     # weight 0                      # Navigation priority. Bigger is higher.
    #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
    #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

    #   # Section specific configuration:

    list do
      exclude_fields :_type, :_id, :created_at, :updated_at
          # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
          # items_per_page 100    # Override default_items_per_page
          # sort_by :id           # Sort column (default is primary key)
          # sort_reverse true     # Sort direction (default is true for primary key, last created first)
        end
    #     show do; end
    #     edit do; end
    #     export do; end
    #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
    #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
    #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


  ###  Shop::UserGroup  ###

  config.model 'Shop::UserGroup' do

    #   # You can copy this to a 'rails_admin do ... end' block inside your shop/user_group.rb model definition

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

    #   # Cross-section configuration:

    #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
    #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
    #     # label_plural 'My models'      # Same, plural
    #     # weight 0                      # Navigation priority. Bigger is higher.
    #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
    #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

    #   # Section specific configuration:

    list do
      exclude_fields :_type, :_id, :created_at, :updated_at
          # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
          # items_per_page 100    # Override default_items_per_page
          # sort_by :id           # Sort column (default is primary key)
          # sort_reverse true     # Sort direction (default is true for primary key, last created first)
        end
    #     show do; end
    #     edit do; end
    #     export do; end
    #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
    #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
    #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end
end
