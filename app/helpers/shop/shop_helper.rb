module Shop::ShopHelper
  def category_link(top_category, category = nil)
    if category.nil?
      link_to raw(top_category.name.gsub(/\s/, '&nbsp;')), shop_path+'/'+top_category.format_name, :id => top_category.format_name
    else
      link_to raw(category.name.gsub(/\s/, '&nbsp;')), shop_path+'/'+top_category+'/'+category.format_name, :id => category.format_name
    end
  end
end
