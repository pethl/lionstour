class User < ActiveRecord::Base
  attr_accessible :admin, :email, :name, :password, :password_confirmation, :password_digest, :remember_token, :matchpicks_attributes
  has_many :matchpicks
  has_secure_password
  accepts_nested_attributes_for :matchpicks, allow_destroy: true
  
  validates :name, presence: true, length: { maximum: 30 },
                    uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates :password_confirmation, presence: true
                    
  before_save :create_remember_token
  after_create :create_squad
  after_create :create_scores
  
  private
  def create_squad
    u = self.id
      m = Matchpick.new(:status => "Initial", :reason => "Team", :choose => "Select..", :user_id => u)
        m.save
    @squadids = Squad.pluck(:id)
    
    i = 0
      x = Squad.count
     
      while i < x do
          s = Playerpick.new(:matchpick_id => m.id, :squad_id => @squadids[i], :selected => false)
          s.save
          i = i += 1
      end
  end

  def create_scores
    u = self.id
      m = Matchpick.new(:status => "Initial", :reason => "Scores", :user_id => u)
        m.save
    @fixtureids = Fixture.where(:test => true).collect {|r| r.id}
    
    i = 0
      x = @fixtureids.count
     
      while i < x do
          s = Predict.new(:matchpick_id => m.id, :fixture_id => @fixtureids[i])
          s.save
          i = i += 1
      end
  end

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
  
end
