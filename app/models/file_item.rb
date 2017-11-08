class FileItem < ApplicationRecord
  include CkeditorAsset

  sample_filter(
    name: {type: :string},
    created_at: {type: :date},
    sort: {type: :sorting, values: [:name, :created_at], default_value: 'created_at_desc'}
  )

  mount_uploader :attached_file, FileItemUploader

  scope :images, -> { where('content_type like ?', "image%") }

  self.per_page = 20

  validates :attached_file, presence: :true

  after_initialize :generate_namehash

  def fetch_file_data!
    if attached_file.present?
      self.name = attached_file.file.original_filename
      self.content_type = attached_file.content_type
    end
  end

  def image?
    content_type.start_with?('image')
  end

  private

  def generate_namehash
    return if namehash.present?

    array = [('a'..'z'), ('A'..'Z'), (0..9)].map { |i| i.to_a }.flatten
    self.namehash = (0...8).map{ array[rand(array.length)] }.join
  end
end
