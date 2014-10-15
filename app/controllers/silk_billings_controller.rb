class SilkBillingsController < ApplicationController
  require 'will_paginate/array'
  # GET /silk_billings
  # GET /silk_billings.xml
  def index
    @silk_billings = SilkBilling.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @silk_billings }
    end
  end

  # GET /silk_billings/1
  # GET /silk_billings/1.xml
  def show
    @silk_billing = SilkBilling.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @silk_billing }
    end
  end

  # GET /silk_billings/new
  # GET /silk_billings/new.xml
  def new
    @silk_billing = SilkBilling.new
    @vendors = Vendor.find(:all,:conditions =>["vendor_type_id = 1"])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @silk_billing }
    end
  end

  # GET /silk_billings/1/edit
  def edit
    @silk_billing = SilkBilling.find(params[:id])
    @vendors = Vendor.find(:all,:conditions =>["vendor_type_id = 1"])
  end

  # POST /silk_billings
  # POST /silk_billings.xml
  def create
    @silk_billing = SilkBilling.new(params[:silk_billing])

    respond_to do |format|
      if @silk_billing.save
        flash[:notice] = 'SilkBilling was successfully created.'
        format.html { redirect_to(@silk_billing) }
        format.xml  { render :xml => @silk_billing, :status => :created, :location => @silk_billing }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @silk_billing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /silk_billings/1
  # PUT /silk_billings/1.xml
  def update
    @silk_billing = SilkBilling.find(params[:id])

    respond_to do |format|
      if @silk_billing.update_attributes(params[:silk_billing])
        flash[:notice] = 'SilkBilling was successfully updated.'
        format.html { redirect_to(@silk_billing) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @silk_billing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /silk_billings/1
  # DELETE /silk_billings/1.xml
  def destroy
    @silk_billing = SilkBilling.find(params[:id])
    @silk_billing.destroy

    respond_to do |format|
      format.html { redirect_to(silk_billings_url) }
      format.xml  { head :ok }
    end
  end
end
