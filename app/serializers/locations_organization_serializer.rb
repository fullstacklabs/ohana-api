class LocationsOrganizationSerializer < ActiveModel::Serializer
  attributes :id, :accreditations, :alternate_name, :date_incorporated,
             :description, :email, :funding_sources, :licenses, :name,
             :website, :slug
end
