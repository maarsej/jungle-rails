require "rails_helper"

RSpec.describe User, type: :model do
  describe "Validations" do
    subject { User.new(first_name: "First", last_name: "Last", email: "email@mail.com") }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:password).is_at_least(5) }
    it { is_expected.to validate_presence_of(:password_confirmation) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }

    it "should be invalid if passwords dont match" do
      invalid_user = User.create({
        first_name: "Invalid",
        last_name: "User",
        email: "test@user.com",
        password: "password",
        password_confirmation: "1234",
      })

      expect(invalid_user).to_not be_valid
    end

    it "should be invalid if email is the same as User1" do
      invalid_user = User.create({
        first_name: "Invalid",
        last_name: "User",
        email: "test@user.com",
        password: "password",
        password_confirmation: "password",
      })

      invalid_user2 = User.create({
        first_name: "Invalid",
        last_name: "User",
        email: "test@user.com",
        password: "password",
        password_confirmation: "password",
      })

      expect(invalid_user2).to_not be_valid
    end
  end

  describe "Check credentials" do
    it "should be valid if proper credentials given" do
      valid_user = User.create({
        first_name: "Valid",
        last_name: "User",
        email: "test@user.com",
        password: "password",
        password_confirmation: "password",
      })

      expect(valid_user.authenticate_user(valid_user.email, valid_user.password)).to eq(valid_user)
      expect(valid_user.authenticate_user("test@email.com", valid_user.password)).to be_nil
      expect(valid_user.authenticate_user(valid_user.email, "invalid_password")).to be_nil
    end
  end

  describe "edge cases" do
    it "should be valid regardless of spacing" do
      valid_user = User.create({
        first_name: "Valid",
        last_name: "User",
        email: "test@user.com",
        password: "password",
        password_confirmation: "password",
      })

      expect(valid_user.authenticate_user("   test@user.com   ", valid_user.password)).to eq(valid_user)
    end

    it "should be valid regardless of case" do
      valid_user = User.create({
        first_name: "Valid",
        last_name: "User",
        email: "test@user.com",
        password: "password",
        password_confirmation: "password",
      })

      expect(valid_user.authenticate_user("tESt@uSeR.cOm", valid_user.password)).to eq(valid_user)
    end

    it "should be valid in login regardless of case in the reverse" do
      valid_user = User.create({
        first_name: "Valid",
        last_name: "User",
        email: "TEST@user.com",
        password: "password",
        password_confirmation: "password",
      })

      expect(valid_user.authenticate_user("test@user.com", valid_user.password)).to eq(valid_user)
    end
  end
end
