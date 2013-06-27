# require "spec_helper"

# describe 'Question' do

#  question = FactoryGirl.create(:question)

#   describe "#index" do
    
#     before do
#       question
#     end

#     it "should return all questions related to user from database" do
#       visit root_path
#       expect(page).to have_content question.title
#     end

#     it "should not have edit links" do
#       visit root_path
#       expect(page).to_not have_link('edit')
#     end

#     it "should not have delete links" do
#       visit root_path
#       expect(page).to_not have_link('delete')
#     end
#   end      
# end
