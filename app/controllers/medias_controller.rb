class MediasController < ApplicationController
		before_filter :media_processed, :only => :process_document
		def index
				@medias = Media.all
		end
		
		def new
				@media = Media.new
		end
		
		def create
				@media = Media.create(params[:media])
				if @media.save
						redirect_to medias_path
				else
						render :new
				end
		end
		
		def edit
		end
		
		def update
		end
		
		def destroy
		end
		
		def process_document
				@media.extract_events
				redirect_to medias_path
		end
		
		def delivery_report
				@users = User.where("role != 'admin'")
				render :layout => false
		end
		
		private
		def media_processed
				if Media.exists?(params[:media_id])
						@media = Media.find(params[:media_id])
						return redirect_to medias_path if @media.is_processed
				else
						return redirect_to medias_path
				end
		end
end
