class InlinePhoto
  include Mongoid::Document
	include Mongoid::Paperclip

	field :position, type: Integer
  has_mongoid_attached_file :photo, 
	  :styles => {
	    :small    => ['100x100#',   :jpg],
	    :large    => ['500x500>',   :jpg]
	  }
	validates_attachment_content_type :photo, :content_type=>['image/jpeg', 'image/png', 'image/gif']
	

end