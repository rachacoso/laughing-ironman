class Audit
  include Mongoid::Document
  field :name, type: String
  field :publication_date, type: Date

  validates :name, presence: true, uniqueness: true
	validates :publication_date, presence: true

  has_one :five_minute_summary
  has_one :full_audit

end
