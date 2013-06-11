class Matchpick < ActiveRecord::Base
  attr_accessible :status, :reason, :user_id, :choose, :playerpicks_attributes
  belongs_to :user
  has_many :playerpicks
  accepts_nested_attributes_for :playerpicks, allow_destroy: true
  
  validates :status, presence: true
    validates :reason, presence: true
  validates :user_id, presence: true
  
  before_save :default_values
  
   PICK_REASONS = ["Team", "Scores"]
      PICK_STATUS = ["Initial", "Locked"]
           PICK_CHOOSE = ["Select..", "Forwards", "Backs", "Summary", "Edit Forwards", "Edit Backs" ]
  
  def default_values
    self.status ||= "Initial"    
  end
  
  
end
