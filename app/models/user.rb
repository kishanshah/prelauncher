class User < ActiveRecord::Base
    belongs_to :referrer, :class_name => "User", :foreign_key => "referrer_id"
    has_many :referrals, :class_name => "User", :foreign_key => "referrer_id"
    
    attr_accessible :email

    validates :email, :uniqueness => true, :format => { :with => /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/i, :message => "Invalid email format." }
    validates :referral_code, :uniqueness => true

    before_create :create_referral_code
    after_create :send_welcome_email

    REFERRAL_STEPS = [
        {
            'count' => 0,
            "html" => "RideX",
            "class" => "two",
            "image" =>  ActionController::Base.helpers.asset_path("refer/ridex.jpg")
        },
        {
            'count' => 1,
            "html" => "Taxi",
            "class" => "three",
            "image" => ActionController::Base.helpers.asset_path("refer/taxi.jpg")
        },
        {
            'count' => 2,
            "html" => "Luxury",
            "class" => "four",
            "image" => ActionController::Base.helpers.asset_path("refer/luxury.JPG")
        },
        {
            'count' => 3,
            "html" => "Elite",
            "class" => "five",
            "image" => ActionController::Base.helpers.asset_path("refer/black.jpg")
        }
    ]

    private

    def create_referral_code
        referral_code = SecureRandom.hex(5)
        @collision = User.find_by_referral_code(referral_code)

        while !@collision.nil?
            referral_code = SecureRandom.hex(5)
            @collision = User.find_by_referral_code(referral_code)
        end

        self.referral_code = referral_code
    end

    def send_welcome_email
        UserMailer.delay.signup_email(self)
    end
end
