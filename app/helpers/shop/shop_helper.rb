module Shop::ShopHelper
  def category_link(category_id)
    category = Category.find(category_id)
    link_to raw(category.name.gsub(/\s/, '&nbsp;')), category_shop_products_path(category), :id => category.format_name
  end
end
