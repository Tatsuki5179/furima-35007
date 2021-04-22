require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  it "全ての項目の入力が存在すれば登録できること" do
    user = build(:user)
    expect(user).to be_valid
  end

  it "nicknameがない場合は登録できないこと" do 
    user = build(:user, nickname: nil) 
    user.valid? 
    expect(user.errors[:nickname]).to include("を入力してください") 
  end

  it "emailがない場合は登録できないこと" do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  it 'password:半角英数混合(半角英語のみ)' do
    @user.password = 'aaaaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
  end

  it "encrypted_passwordがない場合は登録できないこと" do
    user = build(:user, encrypted_password: nil)
    user.valid?
    expect(user.errors[:encrypted_password]).to include("を入力してください")
  end

  it "last_nameがない場合は登録できないこと" do
    user = build(:user, family_name: nil)
    user.valid?
    expect(user.errors[:family_name]).to include("を入力してください")
  end

  it "last_name_kanaがない場合は登録できないこと" do
    user = build(:user, family_name_kana: nil)
    user.valid?
    expect(user.errors[:family_name_kana]).to include("を入力してください")
  end

  it "first_nameがない場合は登録できないこと" do
    user = build(:user, first_name: nil)
    user.valid?
    expect(user.errors[:first_name]).to include("を入力してください")
  end

  it "first_name_kanaがない場合は登録できないこと" do
    user = build(:user, first_name_kana: nil)
    user.valid?
    expect(user.errors[:first_name_kana]).to include("を入力してください")
  end

  it "birth_dayがない場合は登録できないこと" do
    user = build(:user, birth_day: nil)
    user.valid?
    expect(user.errors[:birth_day]).to include("を入力してください")
  end
end
end