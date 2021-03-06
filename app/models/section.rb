class Section
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :section_type, type: String
	field :display_name, type: String
	field :block_order, type: Array

  validates :section_type, :display_name, presence: true

	belongs_to :five_minute_summary
  belongs_to :full_audit
  has_many :content_blocks, :dependent => :destroy
  accepts_nested_attributes_for :content_blocks, :five_minute_summary, :full_audit


  # create a starter content block for each new section created
  def setcontent
  	newblock = self.content_blocks.create(content: '<p>Content goes here</p>')
  	self.block_order = Array.new
  	self.block_order << newblock.id
  end

end
