class API::Appointments < API::Base

  desc "Create a new appointment"
  params do
    requires :session_key, type: String, desc: "Session key"
    optional :comment, type: String, desc: "Comment"
  end
  post 'appointments' do
    placekeeper = Placekeeper.where(session_key: params[:session_key]).first!
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

    transaction = Transaction.new

    Appointment.create!({
      start_minutes: placekeeper.start_minutes,
      haircut: placekeeper.haircut,
      timeslot: placekeeper.timeslot,
      transaction: transaction,
      customer: nil,
      comment: params[:comment]
    })
  end

end