require "spec_helper"

describe 'Question' do

 let (:question) {Question.create(title: "hello world3", content: "sdjkhfsdkjhs" )}

  describe "#index", :js => true do

    it "shows recent questions" do
      question
      visit root_path
      sleep(10)
      expect(page).to have_content question.title
    end

    it "should not have edit links" do
      visit root_path
      expect(page).to_not have_link('edit')
    end

    it "should not have delete links" do
      visit root_path
      expect(page).to_not have_link('delete')
    end
  end      
end
