class FiveMinuteSummary
  include Mongoid::Document

  belongs_to :audit
  has_many :sections
  accepts_nested_attributes_for :sections, :audit


end
