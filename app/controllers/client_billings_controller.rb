class ClientBillingsController < ApplicationController
  # GET /client_billings
  # GET /client_billings.xml
  def index
    @client_billings = ClientBilling.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @client_billings }
    end
  end

  # GET /client_billings/1
  # GET /client_billings/1.xml
  def show
    @client_billing = ClientBilling.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @client_billing }
    end
  end

  # GET /client_billings/new
  # GET /client_billings/new.xml
  def new
    @client_billing = ClientBilling.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @client_billing }
    end
  end

  # GET /client_billings/1/edit
  def edit
    @client_billing = ClientBilling.find(params[:id])
  end

  # POST /client_billings
  # POST /client_billings.xml
  def create
    @client_billing = ClientBilling.new(params[:client_billing])

    respond_to do |format|
      if @client_billing.save
        format.html { redirect_to(@client_billing, :notice => 'Client billing was successfully created.') }
        format.xml  { render :xml => @client_billing, :status => :created, :location => @client_billing }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @client_billing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /client_billings/1
  # PUT /client_billings/1.xml
  def update
    @client_billing = ClientBilling.find(params[:id])

    respond_to do |format|
      if @client_billing.update_attributes(params[:client_billing])
        format.html { redirect_to(@client_billing, :notice => 'Client billing was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @client_billing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /client_billings/1
  # DELETE /client_billings/1.xml
  def destroy
    @client_billing = ClientBilling.find(params[:id])
    @client_billing.destroy

    respond_to do |format|
      format.html { redirect_to(client_billings_url) }
      format.xml  { head :ok }
    end
  end
end
