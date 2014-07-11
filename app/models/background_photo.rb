class BackgroundPhoto
  include Mongoid::Document
	include Mongoid::Paperclip

	field :position, type: Integer
  has_mongoid_attached_file :photo, 
	  :styles => {
	    :small    => ['100x100#',   :jpg],
	    :large    => ['1280',   :jpg]
	  }
	validates_attachment_content_type :photo, :content_type=>['image/jpeg', 'image/png', 'image/gif']

	belongs_to :fms_bg_one, class_name: "FiveMinuteSummary", inverse_of: :first_background_photo
	belongs_to :fms_bg_two, class_name: "FiveMinuteSummary", inverse_of: :second_background_photo
	belongs_to :fms_bg_three, class_name: "FiveMinuteSummary", inverse_of: :third_background_photo
	belongs_to :fms_bg_four, class_name: "FiveMinuteSummary", inverse_of: :fourth_background_photo
	belongs_to :fms_bg_five, class_name: "FiveMinuteSummary", inverse_of: :fifth_background_photo
	belongs_to :full_audit

end