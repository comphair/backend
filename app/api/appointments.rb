class API::Appointments < API::Base

  desc "Create a new appointment"
  params do
    requires :session_key, type: String, desc: "Session key"
    optional :comment, type: String, desc: "Comment"
  end
  post 'appointments' do
    Appointment.create!({
      start_minutes: 1,
      comment: params[:comment]
    })
  end

end