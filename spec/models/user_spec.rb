require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
   context '新規登録できるとき' do

    
    it '全ての項目の入力が存在すれば登録できること' do
      expect(@user).to be_valid
    end
    
    it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
      @user.password = 'a00000'
      @user.password_confirmation = 'a00000'
      expect(@user).to be_valid
    end






   end

   context '新規登録ができないとき' do

    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
     end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'emailに＠がないと登録できない' do
      @user.email = 'test.com'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
      
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'passwordは半角英語のみだと登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is must NOT contain any other characters than alphanumerics."

    end
    it 'passwordが全角だと登録できない' do
      @user.password = 'ああああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is must NOT contain any other characters than alphanumerics."


    end
    it 'passwordが５文字以下だと登録ができない' do
      @user.password = 'a1234'
      @user.password_confirmation = 'a1234'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = 'a12345'
      @user.password_confirmation = 'a1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordは半角英数字混合でないと登録できない' do
      @user.password = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is must NOT contain any other characters than alphanumerics.")
    end
    it '名字が空では登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name can't be blank"
    end
    it '名前が空だと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it '名字のフリガナが空だと登録できない' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana can't be blank"
    end
    it '名前のフリガナが空だと登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it '生年月日が空だと登録できない' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth day can't be blank"
    end
    
   end
  end
end