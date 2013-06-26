# require_relative 'cookie'
require 'spec_helper'
 
describe User do
 
  let(:name)   { "Tom Jones" }
  let(:email)   { "tom@jones.com" }
  let(:password)   { "tomtom" }
  let(:user) { User.new(name: name, email: email, password: password) }
 
  describe "#initialize" do
    context "with valid input" do
      end
    end
 
    context "with invalid input" do
      end
    end
  end
 
end
