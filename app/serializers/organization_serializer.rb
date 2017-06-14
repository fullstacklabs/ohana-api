class OrganizationSerializer < LocationsOrganizationSerializer
  has_one :location, serializer: LocationBasicSerializer
  has_many :contacts
  has_many :phones
end
