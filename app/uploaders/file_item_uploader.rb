class FileItemUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "files/#{model.id}"
  end

  def cache_dir
    'files/tmp'
  end

  def filename
    "#{model.namehash}.#{file.extension}"
  end

  version :thumb, if: :image? do
    process resize_to_fill: [150, 150]
  end

  protected

  def image?(new_file)
    new_file.content_type.start_with?('image')
  end
end
