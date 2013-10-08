require File.join(File.dirname(__FILE__), '../spec_helper')

describe Placekeeper do

  let!(:store) { FactoryGirl.create(:store) }

  let!(:haircut) do
    store.haircuts.delete
    store.haircuts << FactoryGirl.create(:haircut, store: store, duration: 15)
    store.haircuts << FactoryGirl.create(:haircut, store: store, duration: 25)
    store.haircuts << FactoryGirl.create(:haircut, store: store, duration: 21)
    selected_haircut = FactoryGirl.create(:haircut, store: store, duration: 10)
    store.haircuts << selected_haircut
    selected_haircut
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

    it "should be valid if starts at beginning" do
      placekeeper = Placekeeper.new({
        haircut: haircut,
        timeslot: timeslot,
        start_minutes: 1000
        })
      expect(placekeeper.valid?).to be true
    end

    it "shouldn't be valid if starts before beginning" do
      placekeeper = Placekeeper.new({
        haircut: haircut,
        timeslot: timeslot,
        start_minutes: 990
        })
      expect(placekeeper.valid?).to be false
    end

    it "shouldn't be valid if starts one minute after beginning" do
      placekeeper = Placekeeper.new({
        haircut: haircut,
        timeslot: timeslot,
        start_minutes: 1001
        })
      expect(placekeeper.valid?).to be false
    end

    it "should be valid if starts ten minutes after beginning" do
      placekeeper = Placekeeper.new({
        haircut: haircut,
        timeslot: timeslot,
        start_minutes: 1010
        })
      expect(placekeeper.valid?).to be true
    end

    it "shouldn't be valid if starts eleven minutes after beginning" do
      placekeeper = Placekeeper.new({
        haircut: haircut,
        timeslot: timeslot,
        start_minutes: 1011
        })
      expect(placekeeper.valid?).to be false
    end

    it "should be valid if starts 42 minutes after beginning" do
      placekeeper = Placekeeper.new({
        haircut: haircut,
        timeslot: timeslot,
        start_minutes: 1042
        })
      expect(placekeeper.valid?).to be true
    end

  end

end