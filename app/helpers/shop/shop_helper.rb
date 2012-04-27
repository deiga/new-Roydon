module Shop::ShopHelper
  def category_link(category, category_level)
    link_to raw(category.name.gsub(/\s/, '&nbsp;')), params.merge(category_level => category.format_name), :id => category.format_name
  end
end
