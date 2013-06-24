class ScoreboardsController < ApplicationController
  # GET /scoreboards
  # GET /scoreboards.json
  def index
   
  #  @scoreboards = Scoreboard.sum(:matchscore, :group => "user_id")
  #  @scoreboards = @scoreboards.invert.sort

    @scoreboards = get_records.sort_by{ |k, v| v }

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @scoreboards }
    end
  end

  def summary
      @scoreboards = Scoreboard.order("user_id ASC")
       @scoreboards_user = @scoreboards.group_by { |t| t.user_id } 
           @fixtures = Fixture.all
   end

  # GET /scoreboards/1
  # GET /scoreboards/1.json
  def show
    @scoreboard = Scoreboard.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @scoreboard }
    end
  end

  # GET /scoreboards/new
  # GET /scoreboards/new.json
  def new
    @scoreboard = Scoreboard.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @scoreboard }
    end
  end

  # GET /scoreboards/1/edit
  def edit
    @scoreboard = Scoreboard.find(params[:id])
  end
  
  def generate
      Scoreboard.generate(params[:fixture_id])
      redirect_to scoreboards_path, notice: "Match score records generated."
  end

  # POST /scoreboards
  # POST /scoreboards.json
  def create
    @scoreboard = Scoreboard.new(params[:scoreboard])

    respond_to do |format|
      if @scoreboard.save
        format.html { redirect_to @scoreboard, notice: 'Scoreboard was successfully created.' }
        format.json { render json: @scoreboard, status: :created, location: @scoreboard }
      else
        format.html { render action: "new" }
        format.json { render json: @scoreboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /scoreboards/1
  # PUT /scoreboards/1.json
  def update
    @scoreboard = Scoreboard.find(params[:id])

    respond_to do |format|
      if @scoreboard.update_attributes(params[:scoreboard])
        format.html { redirect_to @scoreboard, notice: 'Scoreboard was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @scoreboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scoreboards/1
  # DELETE /scoreboards/1.json
  def destroy
    @scoreboard = Scoreboard.find(params[:id])
    @scoreboard.destroy

    respond_to do |format|
      format.html { redirect_to scoreboards_url }
      format.json { head :no_content }
    end
  end
  
  private
    def get_records
      users = User.all
      scores = Hash.new
      for user in users
        scores[user.id] = Scoreboard.where(:user_id => user.id).sum(:matchscore)
      end
      return scores
    end
end
