class API::Appointments < API::Base

  desc "Create a new appointment"
  params do
    requires :session_key, type: String, desc: "Session key"
    optional :comment, type: String, desc: "Comment"
  end
  post 'appointments' do
    # TODO transaction
    begin
      charge = Stripe::Charge.create({
        amount: 400,
        currency: "usd",
        card: {
          number: "4242424242424242",
          exp_month: 10,
          exp_year: 2014,
          cvc: "314"
        },
        description: "Charge for test@example.com"
      })
      return charge
    rescue Stripe::CardError => e
      # The card has been declined
    end
    # Appointment.create!({
    #   start_minutes: 1,
    #   comment: params[:comment]
    # })
  end

end