class User < ActiveRecord::Base
has_secure_password
  validates :username, presence: true, uniqueness: true,  :on => [ :create]
  belongs_to :rol 
  after_destroy :ensure_an_admin_remains
  validates :password, presence: true, length: { in: 6..20 }, :on => [ :create]
  validates :email, 
             presence: true, 
             uniqueness: true, :on => [ :create, :update ]
  validates_format_of :email, 
    :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, 
    :message => ' - The email provided does not have a valid format.'
  validates :name, :lastname, :rol, presence: true, :on => [ :create, :update ]

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    Mailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|

        user.provider = auth.provider
        user.username = auth.info.name
        user.uid = auth.uid
        user.name = auth.info.first_name
      if :provider == "facebook"  
        user.password = "FBzRGEbIp-"
      else
        user.password = "OTzRGEbIp-"  
      end  
        user.email = auth.info.email
        user.lastname = auth.info.last_name
        @rol = Rol.find_by(rol_name: 'usuario')
        user.rol_id = @rol.id
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        puts "--------------------------------------------------------------"
        puts auth.inspect
        puts "--------------------------------------------------------------"
        user.save!
    end
  end


=begin ###pendiente de ver
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:credit_card
  # attr_accessible :title, :body
  #

  has_many :orders


  attr_accessor :credit_card

  validate do
    if need_credit_card? and credit_card.invalid?
      errors.add :credit_card_id, "Validation error"
    end
  end

  before_save :create_credit_card, :if => :need_credit_card?

  def need_credit_card?
    # credit_card_id.nil? or credit_card.present?
    credit_card.present?
  end

  def create_credit_card
    credit_card.payer_id = self.email
    if credit_card.create
      self.credit_card_id          = credit_card.id
      self.credit_card_description = credit_card.description
      true
    else
      errors.add :credit_card_id, "Validation error"
      false
    end
  end

  def fetch_credit_card
    @fetch_credit_card ||= credit_card_id && CreditCard.find(credit_card_id)
  end

  def credit_card
    @credit_card ||= CreditCard.new
  end

  def credit_card=(hash)
    @credit_card = CreditCard.new(hash)
  end
=end

  private
    def ensure_an_admin_remains
      if User.count.zero?
        raise "Can't delete last user"
      end
    end

end
