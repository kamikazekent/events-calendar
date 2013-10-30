require 'spec_helper'

describe User do
  before { @user = User.new(first_name: "Example", last_name: "User", 
                            email: "euser@nhmu.utah.edu",
                            extension: "51924",
                            username: "euser") }
  subject { @user }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  it { should respond_to(:extension) }
  it { should respond_to(:username) }

  it { should be_valid }

  describe "When first name is not present" do
    before { @user.first_name = " " }
    it { should_not be_valid }
  end

  describe "When last name is not present" do
    before { @user.last_name = " " }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when username is not present" do
    before { @user.username = " " }
    it { should_not be_valid }
  end

  describe "when extension is too long" do
    before { @user.extension = "1" * 6 }
    it { should_not be_valid }
  end

  describe "when extension is too short" do
    before { @user.extension = "1" * 4 }
    it { should_not be_valid }
  end

  describe "when extension is not a number" do
    before { @user.extension = "a" * 5 }
    it { should_not be_valid }
  end
end

describe "#fixed_length_random(length) function" do
  before { @random_number_lengths = [1, 0, 1241234, 16, 25] }

  it "should give back a number of the correct length" do
    @random_number_lengths.each do |random_number|
      if random_number == 0
        expect(fixed_length_random(random_number)).to eq nil
      else
        expect(fixed_length_random(random_number).length).to eq random_number
      end
    end
  end
end
