require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

   context '内容に問題ある場合' do
     it 'nicknameが空では登録できない' do
       @user.nickname = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end

     it 'emailが空では登録できない' do
       @user.email = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Email can't be blank")
     end

     it 'passwordが空では登録できない' do
       @user.password = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Password can't be blank")
     end

     it 'passwordが5文字以下なら登録できない' do
       @user.password = '000aa'
       @user.password_confirmation = '000aa'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
     end

     it 'passwordとpassword_confirmationが一致していないと登録できない' do
       @user.password = '000aaa'
       @user.password_confirmation = '000aaaa'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end

     it 'Passwordが数字のみでは登録できない' do
       @user.password = '000000'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password is invalid")
     end

     it 'Passwordが英語のみでは登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
     end

     it 'passwordが全角では登録できない' do
      @user.password = 'ああああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
     end

     it '重複したemailが存在する場合登録できない' do
       @user.save
       another_user = FactoryBot.build(:user, email:@user.email)
       another_user.valid?
       expect(another_user.errors.full_messages).to include('Email has already been taken')
     end

     it 'emailに@が含まれていないと登録できない' do
      @user.email = 'testtest.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
     end

     it 'last_name_kanjiが空では登録できない' do
       @user.last_name_kanji = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Last name kanji can't be blank")
     end

     it 'first_name_kanjiが空では登録できない' do
       @user.first_name_kanji = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("First name kanji can't be blank")
     end

     it 'last_name_kanjiが半角文字だと登録できない' do
      @user.last_name_kanji = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kanji is invalid")
     end

     it 'first_name_kanjiが半角文字だと登録できない' do
      @user.first_name_kanji = 'taro'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji is invalid")
     end

     it 'last_name_katakanaが空では登録できない' do
       @user.last_name_katakana = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Last name katakana can't be blank")
     end

     it 'first_name_katakanaが空では登録できない' do
       @user.first_name_katakana = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("First name katakana can't be blank")
     end

     it 'last_name_katakanaが半角文字だと登録できない' do
      @user.last_name_katakana = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name katakana is invalid")
     end

     it 'last_name_katakanaが全角漢字だと登録できない' do
      @user.last_name_katakana = '山田'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name katakana is invalid")
     end

     it 'last_name_katakanaが全角ひらがなだと登録できない' do
      @user.last_name_katakana = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name katakana is invalid")
     end

     it 'first_name_katakanaが半角文字だと登録できない' do
      @user.first_name_katakana = 'taro'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name katakana is invalid")
     end

     it 'first_name_katakanaが全角漢字だと登録できない' do
      @user.first_name_katakana = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name katakana is invalid")
     end

     it 'first_name_katakanaが全角ひらがなだと登録できない' do
      @user.first_name_katakana = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name katakana is invalid")
     end

     it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
     end
   end

   context '内容に問題ない場合' do
     it 'nickname,password,password_confirmation,last_name_kanji,first_name_kanji,last_name_katakana,first_name_katakana,birthdayが存在すれば登録できる' do
       expect(@user).to be_valid
     end

     it 'passwordが6文字以上英数字混合なら登録できる' do
       @user.password = '000aaa'
       @user.password_confirmation = '000aaa'
       expect(@user).to be_valid
     end

     it 'last_name_kanjiが全角文字なら登録できる' do
       @user.last_name_kanji = '山田'
       expect(@user).to be_valid
     end

     it 'first_name_kanjiが全角文字なら登録できる' do
       @user.first_name_kanji = '太郎'
       expect(@user).to be_valid
     end

     it 'last_name_katakanaが全角カナなら登録できる' do
       @user.last_name_katakana = 'ヤマダ'
       expect(@user).to be_valid
     end

     it 'first_name_katakanaが全角カナなら登録できる' do
       @user.first_name_katakana = 'タロウ'
       expect(@user).to be_valid
     end

     it 'birthdayが空では登録できない' do
       @user.birthday = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Birthday can't be blank")
     end
    end
  end
end
