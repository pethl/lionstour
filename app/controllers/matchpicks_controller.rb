class MatchpicksController < ApplicationController
  
  def index
    @matchpicks = Matchpick.all
    @matchpicks_by_user = @matchpicks.group_by(&:user_id)
    
    @users = User.all  
        @playerpicks = Playerpick.all
         @playerpicks_by_match = @playerpicks.group_by(&:matchpick_id)
    end
    
    def show
      @matchpick = Matchpick.find(params[:id])
    end
    
    def grid
        @matchpicks = Matchpick.all
    end
    
    def selected
      Playerpick.update_all({selected: true}, {id: params[:select_playerpick_ids]})
      Playerpick.update_all({selected: false}, {id: params[:remove_playerpick_ids]})
     @matchpick = Matchpick.find(params[:matchpick_id])
     redirect_to @matchpick
    end
  
      def choose
        @matchpick = Matchpick.find(params[:matchpick_id])

        respond_to do |format|
          if @matchpick.update_attributes(params[:matchpick])
            
            format.html { redirect_to @matchpick }
            format.json { head :no_content }
          else
            format.html { render action: "edit" }
            format.json { render json: @matchpick.errors, status: :unprocessable_entity }
          end
        end
       end
    
        def lock
           @matchpick = Matchpick.find(params[:matchpick_id])

           respond_to do |format|
             if @matchpick.update_attributes(:status => 'Locked')

               format.html { redirect_to @matchpick }
               format.json { head :no_content }
             else
               format.html { render action: "edit" }
               format.json { render json: @matchpick.errors, status: :unprocessable_entity }
             end
           end
          end
    
    def update
      @matchpick = Matchpick.find(params[:id])

      respond_to do |format|
        if @matchpick.update_attributes(params[:matchpick])
          r = @matchpick.user_id
          @user = User.find(r)
     
          format.html { redirect_to user_path(@user), notice: 'Status was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @matchpick.errors, status: :unprocessable_entity }
        end
      end
     end
end
