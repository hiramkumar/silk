class WarpBillingsController < ApplicationController
  require 'will_paginate/array'
  # GET /warp_billings
  # GET /warp_billings.xml
  def index
    @warp_billings = WarpBilling.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @warp_billings }
    end
  end

  # GET /warp_billings/1
  # GET /warp_billings/1.xml
  def show
    @warp_billing = WarpBilling.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @warp_billing }
    end
  end

  # GET /warp_billings/new
  # GET /warp_billings/new.xml
  def new
    @warp_billing = WarpBilling.new
    @vendors = Vendor.find(:all,:conditions =>["vendor_type_id = 5"])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @warp_billing }
    end
  end

  # GET /warp_billings/1/edit
  def edit
    @warp_billing = WarpBilling.find(params[:id])
    @vendors = Vendor.find(:all,:conditions =>["vendor_type_id = 5"])
  end

  # POST /warp_billings
  # POST /warp_billings.xml
  def create
    @warp_billing = WarpBilling.new(params[:warp_billing])

    respond_to do |format|
      if @warp_billing.save
        flash[:notice] = 'WarpBilling was successfully created.'
        format.html { redirect_to(@warp_billing) }
        format.xml  { render :xml => @warp_billing, :status => :created, :location => @warp_billing }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @warp_billing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /warp_billings/1
  # PUT /warp_billings/1.xml
  def update
    @warp_billing = WarpBilling.find(params[:id])

    respond_to do |format|
      if @warp_billing.update_attributes(params[:warp_billing])
        flash[:notice] = 'WarpBilling was successfully updated.'
        format.html { redirect_to(@warp_billing) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @warp_billing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /warp_billings/1
  # DELETE /warp_billings/1.xml
  def destroy
    @warp_billing = WarpBilling.find(params[:id])
    @warp_billing.destroy

    respond_to do |format|
      format.html { redirect_to(warp_billings_url) }
      format.xml  { head :ok }
    end
  end
end
