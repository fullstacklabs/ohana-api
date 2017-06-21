class Organization < ActiveRecord::Base
  default_scope { order('id DESC') }

  attr_accessible :accreditations, :alternate_name, :date_incorporated,
                  :description, :email, :funding_sources, :legal_status,
                  :licenses, :name, :tax_id, :tax_status, :website,
                  :phones_attributes

  has_one :location, dependent: :destroy
  has_many :programs, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :services, through: :location
  has_many :categories, through: :services

  has_many :phones, dependent: :destroy
  accepts_nested_attributes_for :phones,
                                allow_destroy: true, reject_if: :all_blank

  validates :name,
            presence: { message: I18n.t('errors.messages.blank_for_org') },
            uniqueness: { case_sensitive: false }

  validates :description,
            presence: { message: I18n.t('errors.messages.blank_for_org') }

  validates :email, email: true, allow_blank: true
  validates :website, url: true, allow_blank: true
  validates :date_incorporated, date: true

  validates :accreditations, :funding_sources, :licenses, pg_array: true

  auto_strip_attributes :alternate_name, :description, :email, :legal_status,
                        :name, :tax_id, :tax_status, :website

  def self.with_location(id)
    joins(:location).where('locations.id = (?)', id)
  end

  def self.match_exactly_categories(categories)
    group("organizations.id").having("array_agg(categories.id) @> array[#{categories.join(',')}]")
  end

  extend FriendlyId
  friendly_id :name, use: [:history]

  after_save :touch_locations, if: :needs_touch?

  private

  def needs_touch?
    return false if location.blank?
    name_changed?
  end

  def touch_locations
    location.touch if location
  end
end
