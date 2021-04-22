require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
end


it "nicknameが空だと登録できない" do
  @user.nickname = nil
  @user.valid?
  expect(@user.errors.full_messages).to include("Nickname can't be blank")
end
it "emailが空だと登録できない" do
  @user.email = nil
  @user.valid?
  expect(@user.errors.full_messages).to include("Email can't be blank")
end
it "emailに一意性がないと登録できない" do
  @user.save
  another_user = FactoryBot.build(:user, email: @user.email)
  another_user.valid?
  expect(another_user.errors.full_messages).to include("Email has already been taken")
end

it "passwordが6文字以上であれば登録できること" do
  @user.password = "123456"
  @user.password_confirmation = '123456'
  expect(@user).to be_valid
end

it "passwordがない場合は登録できないこと" do
  @user.password =  ""
  @user.valid?
  expect(@user.errors[:password]).to include("can't be blank")
end

it "password_confirmationがない場合は登録できないこと" do
  @user.password_confirmation = ""
  @user.valid?
  expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
end

it "last_nameが全角入力でなければ登録できないこと" do
  @user.last_name = "ｱｲｳｴｵ"
  @user.valid?
  expect(@user.errors[:last_name]).to include("is invalid")
end

it "first_nameが全角入力でなければ登録できないこと" do
  @user.first_name = "ｱｲｳｴｵ"
  @user.valid?
  expect(@user.errors[:first_name]).to include("is invalid")
end


it "last_name_kanaが全角カタカナでなければ登録できないこと" do
  @user.last_name_kana = "あいうえお"
  @user.valid?
  expect(@user.errors[:last_name_kana]).to include("is invalid")
end

it "first_name_kanaが全角カタカナでなければ登録できないこと" do
  @user.first_name_kana = "あいうえお"
  @user.valid?
  expect(@user.errors[:first_name_kana]).to include("is invalid")
end

it "birth_dateがない場合は登録できないこと" do
  @user.birth_date = ""
  @user.valid?
  expect(@user.errors[:birth_date]).to include("can't be blank")
end
end
end