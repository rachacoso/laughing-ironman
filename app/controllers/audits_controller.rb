class AuditsController < ApplicationController
  def new
  	@audit = Audit.new
  end

  def create

  	new_audit = Audit.create(audit_parameters)
  	if new_audit.valid?
   		new_audit.five_minute_summary = FiveMinuteSummary.new
   		new_audit.five_minute_summary.sections << Section.new(section_type: 'FMSsummary', display_name: 'Summary', position: 0)
  		new_audit.five_minute_summary.sections << Section.new(section_type: 'FMSbackground', display_name: 'Background', position: 1)
  		new_audit.five_minute_summary.sections << Section.new(section_type: 'FMSfindings', display_name: 'Findings and Recommendations', position: 2)
    	new_audit.full_audit = FullAudit.new
      redirect_to index_audits_path, notice:  "You have successfully created a new audit."
    else
    	@errors = new_audit.errors
    	flash[:notice] = "Sorry there was an error. Your audit was not created."
    	@audit = Audit.new
      render action: "new"
    end

  end

  def show
  end

  def index
  	@audits = Audit.all
  end

  private
  def audit_parameters
    params.require(:audit).permit(:name, :publication_date)
  end

end
