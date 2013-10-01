class API::Placekeepers < API::Base

  desc "Create a temporary placekeeper"
  params do
    requires :haircut_id, type: Integer, desc: "Id of the haircut model"
    requires :timeslot_id, type: Integer, desc: "Id of the timeslot model"
    requires :start_minutes, type: Integer, desc: "Number of miniutes when the appointment should start"
  end
  post 'placekeepers' do
    Placekeeper.create!({
      haircut_id: params[:haircut_id],
      timeslot_id: params[:timeslot_id],
      start_minutes: params[:start_minutes],
    })
  end

end