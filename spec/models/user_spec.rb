require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = User.new(email: 'user@example.com', name: 'Example User',
                     password: 'foobar', password_confirmation: 'foobar')
  end

  it 'email,nameがあれば 有効であること' do
    expect(@user).to be_valid
  end

  it 'nameが無ければ無効であること' do
    @user.name = '   '
    expect(@user).not_to be_valid
  end

  it 'emailが無ければ無効であること' do
    @user.email = '   '
    expect(@user).not_to be_valid
  end

  it 'nameは50文字以内であること' do
    @user.name = 'a' * 51
    expect(@user).not_to be_valid
  end

  it 'emailは255文字以内であること' do
    @user.email = 'a' * 244 + '@example.com'
    expect(@user).not_to be_valid
  end

  it 'emailが正しい形式であれば有効であること' do
    valid_addresses = %w[
      user@example.com
      USER@foo.COM
      A_US-ER@foo.bar.org
      first.last@foo.jp
      alice+bob@baz.cn
    ]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      expect(@user).to be_valid
    end
  end

  it 'emailが正しくない形式であれば無効であること' do
    invalid_addresses = %w[
      user@example,com
      user_at_foo.org
      user.name@example.
      foo@bar_baz.com
      foo@bar+baz.com
      foo@bar..com
    ]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      expect(@user).not_to be_valid
    end
  end

  it 'emailは一意であること' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    expect(duplicate_user).not_to be_valid
  end

  it 'emailは小文字で保存されること' do
    mixed_case_email = 'FooBar@example.COM'
    @user.email = mixed_case_email
    @user.save
    expect(@user.reload.email).to eq mixed_case_email.downcase
  end

  it 'passwordが空であれば無効であること' do
    @user.password = @user.password_confirmation = ' ' * 6
    expect(@user).not_to be_valid
  end

  it 'passwordが5文字以下であれば無効であること' do
    @user.password = @user.password_confirmation = 'a' * 5
    expect(@user).not_to be_valid
  end
end
