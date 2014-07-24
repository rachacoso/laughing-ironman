class PublicSection
  include Mongoid::Document
	
	field :display_name, type: String
	field :content

	embedded_in :public_content

end
