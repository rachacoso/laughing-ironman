class Audit
  include Mongoid::Document
  field :name, type: String
  field :publication_date, type: Date

  validates :name, presence: true, uniqueness: true
	validates :publication_date, presence: true

  has_one :five_minute_summary
  has_one :full_audit

  def generate_new_fms

  		sections = {
  			'FMSsummary' => 'Summary',
  			'FMSbackground' => 'Background',
  			'FMSfindings' => 'Findings and Recommendations'
  		}

  		self.five_minute_summary.section_order = Array.new
  		sections.each do |st, dn|
	  		newsummary = Section.new(section_type: st, display_name: dn)
	   		self.five_minute_summary.sections << newsummary
	   		self.five_minute_summary.section_order << newsummary.id
	   	end 
	   	self.five_minute_summary.save!

  end

end
