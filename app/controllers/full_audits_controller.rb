class FullAuditsController < ApplicationController

	layout "full_audit", only: [:show]

def show
	@fa = FullAudit.find(params[:id])

end

def edit
	@fa = FullAudit.find(params[:id])
	
end

end
