class Section
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :section_type, type: String
	field :display_name, type: String
	field :block_order, type: Array

	belongs_to :five_minute_summary
  has_many :content_blocks
  accepts_nested_attributes_for :content_blocks, :five_minute_summary


  # create a starter content block for each new section created
  after_create :setcontent 

  private
  def setcontent
  	self.content_blocks.create(content: 'Content goes here')
  end

end
