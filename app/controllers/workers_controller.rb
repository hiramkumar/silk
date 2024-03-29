class WorkersController < ApplicationController
  require 'will_paginate/array'
  # GET /workers
  # GET /workers.xml
  def index
    @workers = Worker.find(:all, :order =>"id").paginate(:page =>params[:page], :per_page => 10)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @workers }
    end
  end
  
  # GET /workers/1
  # GET /workers/1.xml
  def show
    @worker = Worker.find(params[:id])
    @title = Title.find_by_id(@worker.title_id)
    @worker_type = WorkerType.find_by_id(@worker.worker_type_id)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @worker }
    end
  end

  # GET /workers/new
  # GET /workers/new.xml
  def new
    @worker = Worker.new
    @titles = Title.find(:all)
    @worker_types = WorkerType.find(:all)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @worker }
    end
  end

  # GET /workers/1/edit
  def edit
    @worker = Worker.find(params[:id])
    @titles = Title.find(:all)
    @worker_types = WorkerType.find(:all)
  end

  # POST /workers
  # POST /workers.xml
  def create
    @worker = Worker.new(params[:worker])
    @worker_types = WorkerType.find(:all)

    respond_to do |format|
      if @worker.save
        flash[:notice] = 'Worker was successfully created.'
        format.html { redirect_to(@worker) }
        format.xml  { render :xml => @worker, :status => :created, :location => @worker }
      else
        @titles = Title.find(:all)
        format.html { render :action => "new" }
        format.xml  { render :xml => @worker.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /workers/1
  # PUT /workers/1.xml
  def update
    @worker = Worker.find(params[:id])

    respond_to do |format|
      if @worker.update_attributes(params[:worker])
        flash[:notice] = 'Worker was successfully updated.'
        format.html { redirect_to(@worker) }
        format.xml  { head :ok }
      else
        @titles = Title.find(:all)
        format.html { render :action => "edit" }
        format.xml  { render :xml => @worker.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /workers/1
  # DELETE /workers/1.xml
  def destroy
    @worker = Worker.find(params[:id])
    @worker.destroy

    respond_to do |format|
      format.html { redirect_to(workers_url) }
      format.xml  { head :ok }
    end
  end
  
  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to(:action => "login" )
  end
end
