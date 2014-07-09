class AuditsController < ApplicationController
  def new
  	@audit = Audit.new
  end

  def create

  	new_audit = Audit.create(audit_parameters)
  	if new_audit.valid?
   		new_audit.five_minute_summary = FiveMinuteSummary.new
   		new_audit.generate_new_fms
    	new_audit.full_audit = FullAudit.new
      redirect_to audits_path, notice:  "You have successfully created a new audit."
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
