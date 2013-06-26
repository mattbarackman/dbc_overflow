# require_relative 'cookie'
require 'spec_helper'
 
describe User do
 
  let(:name)   { "Tom Jones" }
  let(:email)   { "tom@jones.com" }
  let(:password)   { "tomtom" }
  let(:user) { User.new(name: name, email: email, password: password) }
 
  describe "#initialize" do
    it "has a name" do
      expect(user.name).to_not be_nil
    end
  end
 
end
