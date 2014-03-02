module FlashHelper
  def render_flash
    render 'flash' if can_flash?
  end

  def can_flash?
    flash.keys.sort == [:action, :from, :object_id, :object_type, :type]
  end

  def flash_object
    flash[:object_type].classify.constantize.where(id: flash[:object_id]).first unless flash[:object_type].nil?
  end

  def flash_path
    File.join(flash[:from].to_s, 'flash', flash[:action].to_s, flash[:type].to_s)
  end
end
