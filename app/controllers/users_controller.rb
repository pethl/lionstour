class UsersController < ApplicationController

  before_filter :correct_user,   only: [:show, :edit, :update]
  before_filter :admin_user,     only: [:index]
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end
  
  

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

        if @user.save
          sign_in @user
            # Tell the UserMailer to send a welcome Email after save
            # UserMailer.welcome_email(@user).deliver
                  
          redirect_to @user, notice: "Thanks for creating your account."
        else
          render 'new'
        end
    
      end
    

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
            sign_in @user
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  
   private

      def signed_in_user
        redirect_to signin_url, notice: "Please sign in." unless signed_in?
      end

      
      def correct_user
         @user = User.find(params[:id])
         redirect_to(root_path) unless current_user?(@user) or current_user.admin? 
         
      end

      def admin_user
            redirect_to(root_path) unless current_user.admin?
      end
  end
  

