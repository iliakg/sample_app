module CkeditorAsset
  extend ActiveSupport::Concern

  def url_thumb
    attached_file_url(:thumb) || ""
  end

  alias_attribute :url_content, :attached_file_url
  alias_attribute :filename, :name
  alias_attribute :format_created_at, :created_at

  def size
    # asset size
  end

  def data=(data)
    # create asset callback
  end
end
