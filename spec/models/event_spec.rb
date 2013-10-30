require 'spec_helper'

describe Event do
  let(:user) { FactoryGirl.create(:user) }
  before  { @event = Event.new( start_datetime: DateTime.now + 1.day, 
                        end_datetime: DateTime.now + 2.days,
                        user_id: user.id,
                        event_type: "Full-museum event",
                        location_id: 1, # This should be changed once Location 
                                        # model is implemented
                        description: "Lorem ipsum dolor sit amet, consectetur.") }

  subject { @event }

  it { should respond_to(:start_datetime) }
  it { should respond_to(:end_datetime) }
  it { should respond_to(:user_id) }
  it { should respond_to(:event_type) }
  it { should respond_to(:location_id) }
  it { should respond_to(:description) }

  it { should be_valid }

  describe "when start_datetime field is empty" do
    before { @event.start_datetime = " " }
    it { should_not be_valid }
  end

  describe "when start_datetime is before today" do
    before { @event.start_datetime = 1.day.ago }
    it { should_not be_valid }
  end

  describe "when end_datetime is empty" do
    before { @event.end_datetime = " " }
    it { should_not be_valid }
  end

  describe "when end_datetime is before today" do
    before { @event.end_datetime = 1.day.ago }
    it { should_not be_valid }
  end

  describe "when end_datetime is before start_datetime" do
    before do
      @event.end_datetime = Time.now
      @event.start_datetime = Time.now + 1.day
    end

    it { should_not be_valid }
  end

  describe "when event_type is blank" do
    before { @event.event_type = " " }
    it { should_not be_valid}
  end

  describe "when description is blank" do
    before { @event.description = " " }
    it { should_not be_valid }
  end
end
