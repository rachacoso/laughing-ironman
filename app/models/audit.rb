class Audit
  include Mongoid::Document
  field :name, type: String
  field :publication_date, type: Date

  validates :name, presence: true, uniqueness: true
	validates :publication_date, presence: true

  has_one :five_minute_summary, :dependent => :destroy
  has_one :full_audit, :dependent => :destroy

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

    def generate_new_fa

      # default section setup
      sections = [
        'Executive Summary',
        'Audit Action Plan',
        'Introduction and Background',
        'Findings and Recommendations'
      ]

      self.full_audit.section_order = Array.new
      sections.each do |dn|
        newsummary = Section.new(section_type: 'full_audit_section', display_name: dn)
        self.full_audit.sections << newsummary
        self.full_audit.section_order << newsummary.id
      end 
      self.full_audit.save!

  end

end
