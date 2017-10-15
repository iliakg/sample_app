module CkeditorHelper

  # path for delete image in ckeditor file browser
  def file_item_path(asset, format)
    if asset.image?
      picture_path(asset)
    else
      attachment_file_path(asset)
    end
  end
end
