require File.join(File.dirname(__FILE__), 'spec_helper')

describe API::Placekeepers do

  let!(:store) { FactoryGirl.create(:store) }

  let!(:haircut) do
    haircut = FactoryGirl.create(:haircut, store: store, duration: 10)
    store.haircuts << haircut
    haircut
  end

  let!(:timeslot) do
    timeslot = FactoryGirl.create(:timeslot, {
      schedule: store.schedule,
      date: Date.new(2011,11,11),
      start_minutes: 1000,
      end_minutes: 1200
      })
    store.schedule.timeslots << timeslot
    timeslot
  end

  describe "POST /placekeepers" do

    it "should return a new placekeeper" do
      post "/placekeepers", {
        haircut_id: haircut.id,
        timeslot_id: timeslot.id,
        start_minutes: 1000
      }
      session_key = JSON.parse(last_response.body)["session_key"]
      expect(last_response.status).to be 201
      expect(session_key).to match /[0-9,a-f]{8}-[0-9,a-f]{4}-[0-9,a-f]{4}-[0-9,a-f]{4}-[0-9,a-f]{12}/
    end

  end

end