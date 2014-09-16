class ReferenceSerializer < ActiveModel::Serializer
  attributes :id, :source, :url
  belongs_to :exposure_id
  url [:show, :index]
end
