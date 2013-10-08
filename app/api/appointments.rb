class API::Appointments < API::Base

  desc "Create a new appointment"
  params do
    requires :session_key, type: String, desc: "Session key"
    optional :comment, type: String, desc: "Comment"
  end
  post 'appointments' do
    # TODO transaction
    if false
      # Set your secret key: remember to change this to your live secret key in production
      # See your keys here https://manage.stripe.com/account
      Stripe.api_key = "sk_test_k5oqJzkJRwMCoOfs392iBqdz"

      # Get the credit card details submitted by the form
      token = params[:stripeToken]

      # Create the charge on Stripe's servers - this will charge the user's card
      begin
        charge = Stripe::Charge.create(
          :amount => 1000, # amount in cents, again
          :currency => "usd",
          :card => token,
          :description => "payinguser@example.com"
        )
      rescue Stripe::CardError => e
        # The card has been declined
      end
    end
    Appointment.create!({
      start_minutes: 1,
      comment: params[:comment]
    })
  end

end