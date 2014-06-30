class Section
  include Mongoid::Document

  field :section_type, type: String
	field :display_name, type: String
	field :position, type: Float

	embedded_in :five_minute_summary
  embeds_many :content_blocks

end
