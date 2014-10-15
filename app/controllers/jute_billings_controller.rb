class JuteBillingsController < ApplicationController
  require 'will_paginate/array'
  # GET /jute_billings
  # GET /jute_billings.xml
  def index
    @jute_billings = JuteBilling.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @jute_billings }
    end
  end

  # GET /jute_billings/1
  # GET /jute_billings/1.xml
  def show
    @jute_billing = JuteBilling.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @jute_billing }
    end
  end

  # GET /jute_billings/new
  # GET /jute_billings/new.xml
  def new
    @jute_billing = JuteBilling.new
    @vendors = Vendor.find(:all,:conditions =>["vendor_type_id = 4"])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @jute_billing }
    end
  end

  # GET /jute_billings/1/edit
  def edit
    @jute_billing = JuteBilling.find(params[:id])
    @vendors = Vendor.find(:all,:conditions =>["vendor_type_id = 4"])
  end

  # POST /jute_billings
  # POST /jute_billings.xml
  def create
    @jute_billing = JuteBilling.new(params[:jute_billing])

    respond_to do |format|
      if @jute_billing.save
        flash[:notice] = 'JuteBilling was successfully created.'
        format.html { redirect_to(@jute_billing) }
        format.xml  { render :xml => @jute_billing, :status => :created, :location => @jute_billing }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @jute_billing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /jute_billings/1
  # PUT /jute_billings/1.xml
  def update
    @jute_billing = JuteBilling.find(params[:id])

    respond_to do |format|
      if @jute_billing.update_attributes(params[:jute_billing])
        flash[:notice] = 'JuteBilling was successfully updated.'
        format.html { redirect_to(@jute_billing) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @jute_billing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /jute_billings/1
  # DELETE /jute_billings/1.xml
  def destroy
    @jute_billing = JuteBilling.find(params[:id])
    @jute_billing.destroy

    respond_to do |format|
      format.html { redirect_to(jute_billings_url) }
      format.xml  { head :ok }
    end
  end
end
