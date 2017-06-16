class LocationBasicSerializer < ActiveModel::Serializer
  attributes :accessibility, :admin_emails, :description, :latitude,
  :longitude, :languages, :name, :short_desc, :transportation, :slug,
  :alternate_name, :virtual, :active, :website, :email

  has_one :address
end
