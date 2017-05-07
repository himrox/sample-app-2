require "rails_helper"

RSpec.describe ApplicationHelper, :type => :helper do

  describe '#full_title' do
    it 'titleの値が与えられてなければ"Ruby on Rails Tutorial Sample App"を返すこと' do
      expect(helper.full_title).to eq 'Ruby on Rails Tutorial Sample App'
    end

    it 'titleの値が与えられていれば"title | Ruby on Rails Tutorial Sample App"を返すこと' do
      expect(helper.full_title('About')).to eq 'About | Ruby on Rails Tutorial Sample App' 
    end
  end

end
