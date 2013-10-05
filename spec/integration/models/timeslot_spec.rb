require File.join(File.dirname(__FILE__), '../spec_helper')

describe Timeslot do

  let(:schedule) do
    store = FactoryGirl.create(:store)
    FactoryGirl.build(:schedule, store: store)
  end

  describe "validation" do

    it "should work" do
      timeslot = FactoryGirl.build(:timeslot, schedule: schedule, date: Date.new(2011,11,11), start_minutes: 0, end_minutes: 2)
      expect(timeslot.valid?).to be true
    end

    it "shouldn't accpet a timeslot with start minutes = end minutes" do
      timeslot = FactoryGirl.build(:timeslot, schedule: schedule, date: Date.new(2011,11,11), start_minutes: 1, end_minutes: 1)
      expect(timeslot.valid?).to be false
    end

    it "shouldn't accpet a timeslot with start minutes > end minutes" do
      timeslot = FactoryGirl.build(:timeslot, schedule: schedule, date: Date.new(2011,11,11), start_minutes: 1, end_minutes: 0)
      expect(timeslot.valid?).to be false
    end

    context "for same day" do

      it "shouldn't accpet a timeslot with same start minutes" do
        schedule.timeslots << FactoryGirl.create(:timeslot, schedule: schedule, date: Date.new(2011,11,11), start_minutes: 0, end_minutes: 2)
        schedule.timeslots << FactoryGirl.build(:timeslot, schedule: schedule, date: Date.new(2011,11,11), start_minutes: 0, end_minutes: 3)
        timeslot = schedule.timeslots.last
        expect(timeslot.valid?).to be false
      end

      it "shouldn't accpet a timeslot with same end minutes" do
        schedule.timeslots << FactoryGirl.create(:timeslot, schedule: schedule, date: Date.new(2011,11,11), start_minutes: 0, end_minutes: 2)
        schedule.timeslots << FactoryGirl.build(:timeslot, schedule: schedule, date: Date.new(2011,11,11), start_minutes: 1, end_minutes: 2)
        timeslot = schedule.timeslots.last
        expect(timeslot.valid?).to be false
      end

      it "shouldn't accpet a timeslot with start minutes within other timeslot" do
        schedule.timeslots << FactoryGirl.create(:timeslot, schedule: schedule, date: Date.new(2011,11,11), start_minutes: 0, end_minutes: 2)
        schedule.timeslots << FactoryGirl.build(:timeslot, schedule: schedule, date: Date.new(2011,11,11), start_minutes: 1, end_minutes: 3)
        timeslot = schedule.timeslots.last
        expect(timeslot.valid?).to be false
      end

      it "shouldn't accpet a timeslot with end minutes within other timeslot" do
        schedule.timeslots << FactoryGirl.create(:timeslot, schedule: schedule, date: Date.new(2011,11,11), start_minutes: 5, end_minutes: 10)
        schedule.timeslots << FactoryGirl.build(:timeslot, schedule: schedule, date: Date.new(2011,11,11), start_minutes: 4, end_minutes: 5)
        timeslot = schedule.timeslots.last
        expect(timeslot.valid?).to be false
      end

      it "shouldn't accpet a timeslot wrapping another timeslot" do
        schedule.timeslots << FactoryGirl.create(:timeslot, schedule: schedule, date: Date.new(2011,11,11), start_minutes: 5, end_minutes: 6)
        schedule.timeslots << FactoryGirl.build(:timeslot, schedule: schedule, date: Date.new(2011,11,11), start_minutes: 4, end_minutes: 7)
        timeslot = schedule.timeslots.last
        expect(timeslot.valid?).to be false
      end

      it "shouldn't accpet a timeslot includes in another timeslot" do
        schedule.timeslots << FactoryGirl.create(:timeslot, schedule: schedule, date: Date.new(2011,11,11), start_minutes: 4, end_minutes: 7)
        schedule.timeslots << FactoryGirl.build(:timeslot, schedule: schedule, date: Date.new(2011,11,11), start_minutes: 5, end_minutes: 6)
        timeslot = schedule.timeslots.last
        expect(timeslot.valid?).to be false
      end

    end

    context "for other day" do

      it "shouldn accpet a timeslot includes in another timeslot" do
        schedule.timeslots << FactoryGirl.create(:timeslot, schedule: schedule, date: Date.new(2011,11,11), start_minutes: 4, end_minutes: 7)
        schedule.timeslots << FactoryGirl.build(:timeslot, schedule: schedule, date: Date.new(2011,11,12), start_minutes: 5, end_minutes: 6)
        timeslot = schedule.timeslots.last
        expect(timeslot.valid?).to be true
      end

    end

  end

end