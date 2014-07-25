class PublicContent
  include Mongoid::Document
	include Mongoid::Timestamps::Created::Short

  field :name, type: String
  field :publication_date, type: Date
  field :background_photos, type: Array

	embeds_many :public_sections

	belongs_to :public_five_minute_summary_audit, class_name: "Audit",  inverse_of: :public_five_minute_summary
  belongs_to :public_full_audit_audit, class_name: "Audit", inverse_of: :public_full_audit


end
