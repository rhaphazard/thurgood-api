class V1::JobsController < V1::ApplicationController
	jsonp	

	def index
	 expose Job.order("created_at DESC").all
	end

	def create
		job = Job.new params[:job]
		if job.save
			expose job
		else
			raise job.errors.full_messages.join(', ')
		end
	rescue Exception => e
		error! :bad_request, 
			:metadata => {:error_description => e.message, 
			:details => WIKI_JOB}
	end

	def show
		job = Job.find_by_job_id(params[:id])
		expose job if job
		error! :not_found, :metadata => {:details => WIKI_JOB} if !job
	end

	def server
		expose Server.find_by_job_id(params[:id])
	end

	def logger
		job = Job.find_by_job_id(params[:id])
		expose LoggerSystem.find(job.papertrail_system)
	end	

	def by_user
		expose Job.by_user_id(params[:user_id])
	end

	def submit
		job = Job.find_by_job_id(params[:id])
		job.submit
		expose job
	rescue Exception => e
		error! :bad_request, :metadata => {:error_description => e.message}		
	end

end