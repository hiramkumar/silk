class CottonBillingsController < ApplicationController
  require 'spreadsheet'
  require 'will_paginate/array'
  # GET /cotton_billings
  # GET /cotton_billings.xml
  def index
    @a = Spreadsheet.open "#{RAILS_ROOT}/public/finance.xls"
    @cotton_billings = CottonBilling.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cotton_billings }
    end
  end

  # GET /cotton_billings/1
  # GET /cotton_billings/1.xml
  def show
    @cotton_billing = CottonBilling.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cotton_billing }
    end
  end

  # GET /cotton_billings/new
  # GET /cotton_billings/new.xml
  def new
    @cotton_billing = CottonBilling.new
    @vendors = Vendor.find(:all,:conditions =>["vendor_type_id = 3"])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cotton_billing }
    end
  end

  # GET /cotton_billings/1/edit
  def edit
    @cotton_billing = CottonBilling.find(params[:id])
    @vendors = Vendor.find(:all,:conditions =>["vendor_type_id = 3"])
  end

  # POST /cotton_billings
  # POST /cotton_billings.xml
  def create
    @cotton_billing = CottonBilling.new(params[:cotton_billing])

    respond_to do |format|
      if @cotton_billing.save
        flash[:notice] = 'CottonBilling was successfully created.'
        format.html { redirect_to(@cotton_billing) }
        format.xml  { render :xml => @cotton_billing, :status => :created, :location => @cotton_billing }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cotton_billing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cotton_billings/1
  # PUT /cotton_billings/1.xml
  def update
    @cotton_billing = CottonBilling.find(params[:id])

    respond_to do |format|
      if @cotton_billing.update_attributes(params[:cotton_billing])
        flash[:notice] = 'CottonBilling was successfully updated.'
        format.html { redirect_to(@cotton_billing) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cotton_billing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cotton_billings/1
  # DELETE /cotton_billings/1.xml
  def destroy
    @cotton_billing = CottonBilling.find(params[:id])
    @cotton_billing.destroy

    respond_to do |format|
      format.html { redirect_to(cotton_billings_url) }
      format.xml  { head :ok }
    end
  end
end
