require "rails_helper"

RSpec.describe SessionsHelper, type: :helper do

  before do
    @user = FactoryGirl.create(:user)
    helper.remember @user
  end

  it 'ログイン情報を記憶すること' do
    expect(helper.current_user).to eq @user
    expect(helper.logged_in?).to eq true
  end

  it 'remember_digestが誤っていれば、ログインできないこと' do
    @user.update_attribute(:remember_digest, User.digest(User.new_token))
    expect(helper.current_user).to eq nil
  end
end
