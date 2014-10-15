class WorkerTypesController < ApplicationController
  # GET /worker_types
  # GET /worker_types.xml
  def index
    @worker_types = WorkerType.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @worker_types }
    end
  end

  # GET /worker_types/1
  # GET /worker_types/1.xml
  def show
    @worker_type = WorkerType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @worker_type }
    end
  end

  # GET /worker_types/new
  # GET /worker_types/new.xml
  def new
    @worker_type = WorkerType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @worker_type }
    end
  end

  # GET /worker_types/1/edit
  def edit
    @worker_type = WorkerType.find(params[:id])
  end

  # POST /worker_types
  # POST /worker_types.xml
  def create
    @worker_type = WorkerType.new(params[:worker_type])

    respond_to do |format|
      if @worker_type.save
        flash[:notice] = 'WorkerType was successfully created.'
        format.html { redirect_to(@worker_type) }
        format.xml  { render :xml => @worker_type, :status => :created, :location => @worker_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @worker_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /worker_types/1
  # PUT /worker_types/1.xml
  def update
    @worker_type = WorkerType.find(params[:id])

    respond_to do |format|
      if @worker_type.update_attributes(params[:worker_type])
        flash[:notice] = 'WorkerType was successfully updated.'
        format.html { redirect_to(@worker_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @worker_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /worker_types/1
  # DELETE /worker_types/1.xml
  def destroy
    @worker_type = WorkerType.find(params[:id])
    @worker_type.destroy

    respond_to do |format|
      format.html { redirect_to(worker_types_url) }
      format.xml  { head :ok }
    end
  end
end
