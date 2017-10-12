class FileItem < ApplicationRecord
  mount_uploader :attached_file, FileItemUploader

  validates :attached_file, presence: :true

  self.per_page = 20

  after_initialize :generate_namehash

  def fetch_name!
    self.name = attached_file.file.original_filename if attached_file.present?
  end

  private

  def generate_namehash
    array = [('a'..'z'), ('A'..'Z'), (0..9)].map { |i| i.to_a }.flatten
    self.namehash ||= (0...8).map{ array[rand(array.length)] }.join
  end
end
