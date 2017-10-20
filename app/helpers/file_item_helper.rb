module FileItemHelper

  def show_name(file_item)
    file_item.name || file_item.namehash
  end

  def thumb_image_tag(file_item)
    image_tag file_item.image? ? file_item.attached_file_url(:thumb) : 'file_default.png'
  end

  def link_to_dowload_file_item(file_item)
    link_to @file_item.attached_file_url, download: '' do
      "<span>#{tt(:file_items, :download)}</span> <i class='material-icons'>file_download</i>".html_safe
    end
  end

  def link_to_delete_file_item(file_item)
    link_to admin_file_item_path(file_item), method: :delete, class: 'delete', data: {confirm: tt(:delete_confirm)} do
      '<i class="material-icons">delete</i>'.html_safe
    end
  end
end
