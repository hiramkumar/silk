class LoginDetailsController < ApplicationController
  require 'will_paginate/array'
  # GET /login_details
  # GET /login_details.xml
  def index
    #@login_details = LoginDetail.find(:all,:order => "id desc")
    @login_details = LoginDetail.find(:all,:order => "id desc",:limit => "100").paginate(:page =>params[:page], :per_page => 10)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @login_details }
    end
  end

  # GET /login_details/1
  # GET /login_details/1.xml
  def show
    @login_detail = LoginDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @login_detail }
    end
  end

  # GET /login_details/new
  # GET /login_details/new.xml
  def new
    @login_detail = LoginDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @login_detail }
    end
  end

  # GET /login_details/1/edit
  def edit
    @login_detail = LoginDetail.find(params[:id])
  end

  # POST /login_details
  # POST /login_details.xml
  def create
    @login_detail = LoginDetail.new(params[:login_detail])

    respond_to do |format|
      if @login_detail.save
        format.html { redirect_to(@login_detail, :notice => 'Login detail was successfully created.') }
        format.xml  { render :xml => @login_detail, :status => :created, :location => @login_detail }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @login_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /login_details/1
  # PUT /login_details/1.xml
  def update
    @login_detail = LoginDetail.find(params[:id])

    respond_to do |format|
      if @login_detail.update_attributes(params[:login_detail])
        format.html { redirect_to(@login_detail, :notice => 'Login detail was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @login_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /login_details/1
  # DELETE /login_details/1.xml
  def destroy
    @login_detail = LoginDetail.find(params[:id])
    @login_detail.destroy

    respond_to do |format|
      format.html { redirect_to(login_details_url) }
      format.xml  { head :ok }
    end
  end
end
