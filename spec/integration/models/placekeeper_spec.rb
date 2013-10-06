require File.join(File.dirname(__FILE__), '../spec_helper')

describe Placekeeper do

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

  describe "hole prevention" do

    it "should be valid if starts at beginning of timeslot" do
      placekeeper = Placekeeper.new({
        haircut: haircut,
        timeslot: timeslot,
        start_minutes: 1000
        })
      expect(placekeeper.valid?).to be true
    end

  end

end