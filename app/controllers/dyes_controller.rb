class DyesController < ApplicationController
  require 'will_paginate/array'
  # GET /dyes
  # GET /dyes.xml
  def index
    @dyes = Dye.find(:all).paginate(:page =>params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dyes }
    end
  end

  # GET /dyes/1
  # GET /dyes/1.xml
  def show
    @dye = Dye.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dye }
    end
  end

  # GET /dyes/new
  # GET /dyes/new.xml
  def new
    @dye = Dye.new
    @workers = Worker.find(:all,:conditions =>["worker_type_id = 2"])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dye }
    end
  end

  # GET /dyes/1/edit
  def edit
    @dye = Dye.find(params[:id])
    @workers = Worker.find(:all,:conditions =>["worker_type_id = 2"])
  end

  # POST /dyes
  # POST /dyes.xml
  def create
    @dye = Dye.new(params[:dye])

    respond_to do |format|
      if @dye.save
        flash[:notice] = 'Dye was successfully created.'
        format.html { redirect_to(@dye) }
        format.xml  { render :xml => @dye, :status => :created, :location => @dye }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dye.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dyes/1
  # PUT /dyes/1.xml
  def update
    @dye = Dye.find(params[:id])

    respond_to do |format|
      if @dye.update_attributes(params[:dye])
        flash[:notice] = 'Dye was successfully updated.'
        format.html { redirect_to(@dye) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dye.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dyes/1
  # DELETE /dyes/1.xml
  def destroy
    @dye = Dye.find(params[:id])
    @dye.destroy

    respond_to do |format|
      format.html { redirect_to(dyes_url) }
      format.xml  { head :ok }
    end
  end
end
