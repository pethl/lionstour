module ApplicationHelper
 
  
  def link_to_add_fields(name, f, association)
     new_object = f.object.send(association).klass.new
     id = new_object.object_id
     fields = f.fields_for(association, new_object, child_index: id) do |builder|
       render(association.to_s.singularize + "_fields", f: builder)
     end
     link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
   end
   
   def username(id)
     username = User.find_by_id(id).name
    end
    
    def fixture_match(id)
      fixture_match = Fixture.find_by_id(id).match
    end

    def fixture_location(id)
      fixture_location = Fixture.find_by_id(id).location
    end

    def get_predictions_for_fixture(fix_id)
      @predicts = Predict.where(:fixture_id => fix_id)
    end
    
    def get_user_name_for_prediction(matchpick_id)
      @matchpicks = Matchpick.where(:id => matchpick_id, :reason => "Scores")
        if @matchpicks.any?
  			for matchpick in @matchpicks do
  			  user_name = User.find(matchpick.user_id).name
  		    return user_name
		    end
	    end
    end  

end
