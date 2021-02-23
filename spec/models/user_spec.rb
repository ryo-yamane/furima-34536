require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
      context '新規登録できる時' do
        it 'パスワードは6文字以上で半角英数の混合が必須且つ確認用と一致すれば登録できる' do
          @user.password = "1q1q1q1q"
          @user.password_confirmation = "1q1q1q1q"
          expect(@user).to be_valid
        end
        it '全ての情報があれば登録できる'do
          expect(@user.valid?).to eq true
         end
      end



    context '新規登録でき無い時' do
      it 'nicknameが空では登録でき無い' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
       end
       it 'emailが空では登録でき無い' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
       end
      it 'パスワードが空では登録でき無い' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードは5文字以下では登録でき無い' do
        @user.password = "000qq"
        @user.password_confirmation = "000qq"
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      
      it 'パスワードは確認用を含めて２回入力が必要' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'パスワードは、確認用と一致しなければ登録でき無い' do
        @user.password = "2w2w2w2w"
        @user.password_confirmation = "1q1q1q1q"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在すれば登録でき無い' do
       @user.save
       another_user = FactoryBot.build(:user)
       another_user.email = @user.email
       another_user.valid?
       expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'ユーザー本名は名前が空では登録でき無い' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name 全角文字を使用してください")
      end
      it 'ユーザー本名は苗字が空では登録でき無い' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name 全角文字を使用してください")
      end
      
      it 'ユーザー本名(苗字）は全角でないと登録登録でき無い' do
        @user.first_name = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
      it 'ユーザー本名(名前）は全角でないと登録登録でき無い' do
        @user.last_name = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
      end
      it 'ユーザー本名のフリガナは名前が空では登録でき無い' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'ユーザー本名のフリガナは苗字が空では登録でき無い' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'ユーザー本名苗字のフリガナは全角（カタカナ）でないと登録でき無い' do
          @user.last_name_kana = "かな"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana カタカナでお願いします")
      end
      it 'ユーザー本名名前のフリガナは全角（カタカナ）でないと登録でき無い' do
        @user.first_name_kana = "かな"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana カタカナでお願いします")
    end
      it '生年月日が空では登録でき無い' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'emailに＠が含まれてい無いと登録でき無いこと' do
        @user.email = "aa.aa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'Passwordが半角英字だけでは登録でき無いこと' do
        @user.password = "1111111"
        @user.password_confirmation = "1111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'Passwordが半角数字だけでは登録でき無いこと' do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it '全角では登録できないこと' do
        @user.password = "ＡＡＡＡＡＡＡＡ"
        @user.password_confirmation = "ＡＡＡＡＡＡＡＡ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
    end
  end
end
