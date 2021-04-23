require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

  describe 'ユーザー新規登録' do

  context '新規登録できるとき' do

    it 'nickname、email、password、password_confirmation、last_name、first_name、
    last_name_kana、first_name_kana、birthdayが存在すれば登録できる' do
      expect(@user).to be_valid
    end

    it "passwordが6文字以上であれば登録できること" do
      @user.password = "Yama5179"
      @user.password_confirmation = "Yama5179"
      @user.valid?
      expect(@user).to be_valid
    end
  end


   context '新規登録できないとき' do

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

    it "emailに@が含まれていない場合登録できない" do
     @user.email = "hogehuga.com"
     @user.valid?
     expect(@user.errors[:email]).to include("is invalid")
    end

    it "password_confirmationが一致しない場合登録できない" do
     @user = User.new(email: 'test@test.com', password: 'hogehoge', password_confirmation: 'hoge')
     @user.valid?
     expect(@user.errors[:password_confirmation]).to be_present
    end


    it "passwordがない場合は登録できないこと" do
     @user.password =  ""
     @user.valid?
     expect(@user.errors[:password]).to include("can't be blank")
    end

    it "passwordが半角英数字混合でなければ登録できない(英字のみ)" do
     @user.password = "asdzxc"
     @user.password_confirmation = "asdzxc"
     @user.valid?
     expect(@user.errors[:password]).to include("is invalid")
    end


    it "passwordが半角英数字混合でなければ登録できない(数字のみ)" do
     @user.password = "123456"
     @user.password_confirmation = "123456"
     @user.valid?
     expect(@user.errors[:password]).to include("is invalid")
    end

    it "passwordが全角英数混合は登録できない" do
     @user.password = "ｱｲｳ１２３"
     @user.password_confirmation = "ｱｲｳ１２３"
     @user.valid?
     expect(@user.errors[:password]).to include("is invalid")
    end
   it "password_confirmationがない場合は登録できないこと" do
     @user.password_confirmation = ""
     @user.valid?
     expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
    end

   it "passwordが5文字以下である場合は登録できないこと" do
     @user.password = "11aaa"
     @user.valid?
     expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)")
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

   it 'last_nameが空では登録できない' do
    @user.last_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name can't be blank")
   end

   it 'first_nameが空では登録できない' do
    @user.first_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("First name can't be blank")
   end

   it 'last_name_kanaが空では登録できない' do
    @user.last_name_kana = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name kana can't be blank")
   end

   it 'first_name_kanaが空では登録できない' do
    @user.first_name_kana = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana can't be blank")
   end

   it "birth_dateがない場合は登録できないこと" do
    @user.birth_date = ""
    @user.valid?
    expect(@user.errors[:birth_date]).to include("can't be blank")
   end
  end
 end
end
end
