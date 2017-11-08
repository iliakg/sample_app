class TagSerializer < ActiveModel::Serializer
  attributes  :label

  def label
    object.name
  end
end
