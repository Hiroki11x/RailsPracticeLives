class ProjectsController < ApplicationController

	def index
		@projects = Project.all #@をつけるとViewでも使える
		@url = [createURL(125647),createURL(309277)]
		render :index
	end

	# GET /projects/:id
	def show
		@project = Project.find(params[:id])
		#urlで渡ってきた数字をparamsで取れる
		render :show
	end

	def new
		@project = Project.new
		# render :new
	end

	def create
		@project = Project.new(project_params)
		if  #セーブがうまく行ったとき(入力があったとき)
			@project.save
			redirect_to projects_path
		else 
			render 'new'
		end
	end

	def edit
		@project = Project.find(params[:id])
	end

	def update
		@project = Project.find(params[:id])
		if 
			@project.update(project_params)
			redirect_to projects_path
		else
			render 'edit'
		end
	end

	def destroy #delete処理
		@project = Project.find(params[:id])
		@project.destroy
		redirect_to projects_path
	end

	#保存する仕組みはvalidationで制御
	private #セキュリティのためにするようになったらしいフィルター的な
		def project_params
			params[:project].permit(:title)
		end

	def createURL(id)
		str1 = "https://lvimg.jp/job/img/job_pict/"
		str2 = (id%100).to_s 
		str3 = "/"
		str4 = id.to_s
		str5 = "/big.jpg/180x135-f1"
		str=str1+str2+str3+str4+str5
		return str
	end


end
