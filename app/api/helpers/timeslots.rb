class API::Helpers::Timeslots < API::Base

  desc "Create a new timeslot"
  params do
    requires :schedule_id, type: Integer, desc: "Schedule id"
    requires :date, type: Date, desc: "Date"
    requires :start_minutes, type: Integer, desc: "Start minutes"
    requires :end_minutes, type: Integer, desc: "End minutes"
  end
  post 'helpers/timeslots' do
    Timeslot.create!({
      schedule_id: params[:schedule_id],
      date: params[:date],
      start_minutes: params[:start_minutes],
      end_minutes: params[:end_minutes]
      })
  end

end