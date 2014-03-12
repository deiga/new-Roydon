camodule Mall
  module ApplicationHelper
    def category_link(category)
      link_to raw(category.name.gsub(/\s/, '&nbsp;')), category_shop_products_path(category), id: category.permalink
    end
  end
end
