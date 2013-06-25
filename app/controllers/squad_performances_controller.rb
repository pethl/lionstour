class SquadPerformancesController < ApplicationController
  # GET /squad_performances
  # GET /squad_performances.json
  def index
    @squad_performances = SquadPerformance.order("fixture_id ASC")
    @squad_performances_fixture = @squad_performances.group_by { |t| t.fixture_id } 
        @fixtures = Fixture.all
      
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @squad_performances }
    end
  end

  def played
     @squad_performances = SquadPerformance.order("fixture_id ASC")
     @squad_performances_fixture = @squad_performances.group_by { |t| t.fixture_id } 
         @fixtures = Fixture.all

     respond_to do |format|
       format.html # index.html.erb
       format.json { render json: @squad_performances }
     end
   end

  # GET /squad_performances/1
  # GET /squad_performances/1.json
  def show
    @squad_performance = SquadPerformance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @squad_performance }
    end
  end

  # GET /squad_performances/new
  # GET /squad_performances/new.json
  def new
    @squad_performance = SquadPerformance.new
      @fixtures = Fixture.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @squad_performance }
    end
  end

  def generate
      SquadPerformance.generate(params[:fixture_id])
      redirect_to squad_performances_path, notice: "Fixture record set generate."
  end

  def onfield
    SquadPerformance.update_all({play: true}, {id: params[:squad_performance_ids]})
    redirect_to squad_performances_path
  end

  # GET /squad_performances/1/edit
  def edit
    @squad_performance = SquadPerformance.find(params[:id])
      @fixtures = Fixture.all
  end

  # POST /squad_performances
  # POST /squad_performances.json
  def create
    @squad_performance = SquadPerformance.new(params[:squad_performance])

    respond_to do |format|
      if @squad_performance.save
        format.html { redirect_to @squad_performance, notice: 'Squad performance was successfully created.' }
        format.json { render json: @squad_performance, status: :created, location: @squad_performance }
      else
        format.html { render action: "new" }
        format.json { render json: @squad_performance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /squad_performances/1
  # PUT /squad_performances/1.json
  def update
    @squad_performance = SquadPerformance.find(params[:id])

    respond_to do |format|
      if @squad_performance.update_attributes(params[:squad_performance])
        format.html { redirect_to @squad_performance, notice: 'Squad performance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @squad_performance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /squad_performances/1
  # DELETE /squad_performances/1.json
  def destroy
    @squad_performance = SquadPerformance.find(params[:id])
    @squad_performance.destroy

    respond_to do |format|
      format.html { redirect_to squad_performances_url }
      format.json { head :no_content }
    end
  end
end
