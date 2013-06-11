class PredictsController < ApplicationController
  # GET /predicts
  # GET /predicts.json
  def index
    @predicts = Predict.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @predicts }
    end
  end
  
  def scores
    @predict = Predict.find(params[:id])
         if @predict.update_attributes(:homescore => (params[:home_predict]),:awayscore => (params[:away_predict]))
          end  
          @user = User.find(params[:user_id])
   redirect_to user_path(@user)
  end

  def lock
     @matchpick = Matchpick.find(params[:matchpick_id])

     respond_to do |format|
       if @matchpick.update_attributes(:status => 'Locked')

         format.html { redirect_to predict_path(@matchpick) }
         format.json { head :no_content }
       else
         format.html { render action: "edit" }
         format.json { render json: @matchpick.errors, status: :unprocessable_entity }
       end
     end
    end

  # GET /predicts/1
  # GET /predicts/1.json
  def show
    @predicts = Predict.where(params[:matchpick_id])
    @matchpick = Matchpick.find(params[:id])
   @fixtures = Fixture.all
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @predict }
    end
  end

  # GET /predicts/new
  # GET /predicts/new.json
  def new
    @predict = Predict.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @predict }
    end
  end

  # GET /predicts/1/edit
  def edit
    @predict = Predict.find(params[:id])
  end

  # POST /predicts
  # POST /predicts.json
  def create
    @predict = Predict.new(params[:predict])

    respond_to do |format|
      if @predict.save
        format.html { redirect_to @predict, notice: 'Predict was successfully created.' }
        format.json { render json: @predict, status: :created, location: @predict }
      else
        format.html { render action: "new" }
        format.json { render json: @predict.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /predicts/1
  # PUT /predicts/1.json
  def update
    @predict = Predict.find(params[:id])

    respond_to do |format|
      if @predict.update_attributes(params[:predict])
        format.html { redirect_to @predict, notice: 'Predict was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @predict.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /predicts/1
  # DELETE /predicts/1.json
  def destroy
    @predict = Predict.find(params[:id])
    @predict.destroy

    respond_to do |format|
      format.html { redirect_to predicts_url }
      format.json { head :no_content }
    end
  end
end
