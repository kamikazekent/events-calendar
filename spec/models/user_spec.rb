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
end
