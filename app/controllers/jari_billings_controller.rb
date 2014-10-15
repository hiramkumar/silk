class JariBillingsController < ApplicationController
  require 'will_paginate/array'
  # GET /jari_billings
  # GET /jari_billings.xml
  def index
    @jari_billings = JariBilling.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @jari_billings }
    end
  end

  # GET /jari_billings/1
  # GET /jari_billings/1.xml
  def show
    @jari_billing = JariBilling.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @jari_billing }
    end
  end

  # GET /jari_billings/new
  # GET /jari_billings/new.xml
  def new
    @jari_billing = JariBilling.new
    @vendors = Vendor.find(:all,:conditions =>["vendor_type_id = 2"])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @jari_billing }
    end
  end

  # GET /jari_billings/1/edit
  def edit
    @jari_billing = JariBilling.find(params[:id])
    @vendors = Vendor.find(:all,:conditions =>["vendor_type_id = 2"])
  end

  # POST /jari_billings
  # POST /jari_billings.xml
  def create
    @jari_billing = JariBilling.new(params[:jari_billing])

    respond_to do |format|
      if @jari_billing.save
        flash[:notice] = 'JariBilling was successfully created.'
        format.html { redirect_to(@jari_billing) }
        format.xml  { render :xml => @jari_billing, :status => :created, :location => @jari_billing }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @jari_billing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /jari_billings/1
  # PUT /jari_billings/1.xml
  def update
    @jari_billing = JariBilling.find(params[:id])

    respond_to do |format|
      if @jari_billing.update_attributes(params[:jari_billing])
        flash[:notice] = 'JariBilling was successfully updated.'
        format.html { redirect_to(@jari_billing) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @jari_billing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /jari_billings/1
  # DELETE /jari_billings/1.xml
  def destroy
    @jari_billing = JariBilling.find(params[:id])
    @jari_billing.destroy

    respond_to do |format|
      format.html { redirect_to(jari_billings_url) }
      format.xml  { head :ok }
    end
  end
end
