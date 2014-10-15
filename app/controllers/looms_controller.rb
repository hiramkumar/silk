class LoomsController < ApplicationController
  # GET /looms
  # GET /looms.xml
  def index
    @looms = Loom.find(:all).paginate(:page =>params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @looms }
    end
  end
  
  # GET /looms/1
  # GET /looms/1.xml
  def show
    @loom = Loom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @loom }
    end
  end

  # GET /looms/new
  # GET /looms/new.xml
  def new
    @loom = Loom.new
    @workers = Worker.find(:all,:conditions =>["worker_type_id = 1",])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @loom }
    end
  end

  # GET /looms/1/edit
  def edit
    @loom = Loom.find(params[:id])
    @workers = Worker.find(:all,:conditions =>["worker_type_id = 1",])
  end

  # POST /looms
  # POST /looms.xml
  def create
    @loom = Loom.new(params[:loom])

    respond_to do |format|
      if @loom.save
        flash[:notice] = 'Loom was successfully created.'
        format.html { redirect_to(@loom) }
        format.xml  { render :xml => @loom, :status => :created, :location => @loom }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @loom.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /looms/1
  # PUT /looms/1.xml
  def update
    @loom = Loom.find(params[:id])

    respond_to do |format|
      if @loom.update_attributes(params[:loom])
        flash[:notice] = 'Loom was successfully updated.'
        format.html { redirect_to(@loom) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @loom.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /looms/1
  # DELETE /looms/1.xml
  def destroy
    @loom = Loom.find(params[:id])
    @loom.destroy

    respond_to do |format|
      format.html { redirect_to(looms_url) }
      format.xml  { head :ok }
    end
  end
end
