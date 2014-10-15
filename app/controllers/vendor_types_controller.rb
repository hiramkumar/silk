class VendorTypesController < ApplicationController
  # GET /vendor_types
  # GET /vendor_types.xml
  def index
    @vendor_types = VendorType.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @vendor_types }
    end
  end

  # GET /vendor_types/1
  # GET /vendor_types/1.xml
  def show
    @vendor_type = VendorType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @vendor_type }
    end
  end

  # GET /vendor_types/new
  # GET /vendor_types/new.xml
  def new
    @vendor_type = VendorType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @vendor_type }
    end
  end

  # GET /vendor_types/1/edit
  def edit
    @vendor_type = VendorType.find(params[:id])
  end

  # POST /vendor_types
  # POST /vendor_types.xml
  def create
    @vendor_type = VendorType.new(params[:vendor_type])

    respond_to do |format|
      if @vendor_type.save
        flash[:notice] = 'VendorType was successfully created.'
        format.html { redirect_to(@vendor_type) }
        format.xml  { render :xml => @vendor_type, :status => :created, :location => @vendor_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @vendor_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /vendor_types/1
  # PUT /vendor_types/1.xml
  def update
    @vendor_type = VendorType.find(params[:id])

    respond_to do |format|
      if @vendor_type.update_attributes(params[:vendor_type])
        flash[:notice] = 'VendorType was successfully updated.'
        format.html { redirect_to(@vendor_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @vendor_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /vendor_types/1
  # DELETE /vendor_types/1.xml
  def destroy
    @vendor_type = VendorType.find(params[:id])
    @vendor_type.destroy

    respond_to do |format|
      format.html { redirect_to(vendor_types_url) }
      format.xml  { head :ok }
    end
  end
end
