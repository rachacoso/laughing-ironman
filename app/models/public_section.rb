class PublicSection
  include Mongoid::Document
	
	field :section_type, type: String
	field :display_name, type: String
	field :section_id, type: String
	field :content

	embedded_in :public_content

end
