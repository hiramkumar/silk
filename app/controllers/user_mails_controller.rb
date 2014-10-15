class UserMailsController < ApplicationController
  # GET /user_mails
  # GET /user_mails.xml
  def index
    @user_mails = UserMail.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user_mails }
    end
  end

  # GET /user_mails/1
  # GET /user_mails/1.xml
  def show
    @user_mail = UserMail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user_mail }
    end
  end

  # GET /user_mails/new
  # GET /user_mails/new.xml
  def new
    @user_mail = UserMail.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_mail }
    end
  end

  # GET /user_mails/1/edit
  def edit
    @user_mail = UserMail.find(params[:id])
  end

  # POST /user_mails
  # POST /user_mails.xml
  def create
    @user_mail = UserMail.new(params[:user_mail])

    respond_to do |format|
      if @user_mail.save
        # Tell the UserMailer to send a welcome Email after save
        UserMailer.welcome_email(@user_mail).deliver
        
        format.html { redirect_to(@user_mail, :notice => 'User mail was successfully created.') }
        format.xml  { render :xml => @user_mail, :status => :created, :location => @user_mail }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_mail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /user_mails/1
  # PUT /user_mails/1.xml
  def update
    @user_mail = UserMail.find(params[:id])

    respond_to do |format|
      if @user_mail.update_attributes(params[:user_mail])
        format.html { redirect_to(@user_mail, :notice => 'User mail was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_mail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_mails/1
  # DELETE /user_mails/1.xml
  def destroy
    @user_mail = UserMail.find(params[:id])
    @user_mail.destroy

    respond_to do |format|
      format.html { redirect_to(user_mails_url) }
      format.xml  { head :ok }
    end
  end
end
