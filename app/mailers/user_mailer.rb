class UserMailer < ActionMailer::Base
    default from: "Prelaunchr <kishan.shah@gmail.com>"

    def signup_email(user)
        @user = user
        @twitter_message = "Free rides galore!"

        mail(:to => user.email, :subject => "Thanks for signing up!")
    end
end
