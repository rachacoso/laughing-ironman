class InlinePhoto
  include Mongoid::Document
	include Mongoid::Paperclip

	field :position, type: Integer
  has_mongoid_attached_file :photo, 
	  :styles => {
	    :small    => ['100x100#'],
	    :medium		=> ['400'],
	    :large    => ['800>']
	  }
	validates_attachment_content_type :photo, :content_type=>['image/jpeg', 'image/png', 'image/gif']
	
	belongs_to :audit
	
end