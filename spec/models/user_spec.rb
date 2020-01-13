require 'rails_helper'
describe User do
  describe '#step2_user_form' 
  # 1. nicknameとemail、passwordが存在すれば登録できること
    it "is valid with a nickname, email, password "  do
     user = build(:user)
     user.valid?
     expect(user).to be_valid
    end

    # 2. nicknameが空では登録できないこと
    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    # 3. 重複したemailが存在する場合登録できないこと
    it "is invalid with a duplicate email " do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します", "はすで使われています")
    end
    
     # 4. emailが空では登録できないこと
     it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください", "フォーマットが不適切です")
    end

    # 5. フォーマットが不適切な時は登録できない
    it "Improper format" do
      user = build(:user, email: "aaaaaa@aaaa")
      user.valid?
      expect(user.errors[:email]).to include("フォーマットが不適切です")
    end

    # 6. passwordが空では登録できないこと
    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください", "フォーマットが不適切です")
    end

     # 7. passwordが7以上128文字以下であれば登録できないこと
     it "is invalid with a password that has less than 128 characters " do
      user = build(:user, password: "1234567890123456789012345678912344567890123456789012345678901234567890123456789012345678901234557890123456789012345678901234567890")
      user.valid?
      expect(user.errors[:password]).to include("は128文字以内で入力してください", "フォーマットが不適切です")
    end

     # 8. passwordが英数字でない限り登録できない
    it "Password cannot be registered unless it is alphanumeric" do
      user = build(:user, password: "0000000")
      user.valid?
      expect(user.errors[:password]).to include("フォーマットが不適切です")
    end

    # 9. first_name_zenkakuが空では登録できないこと
    it "is invalid without a first_name_zenkaku" do
      user = build(:user, first_name_zenkaku: nil)
      user.valid?
      expect(user.errors[:first_name_zenkaku]).to include("を入力してください")
    end

    # 10. first_name_zenkakuが30字以内でないと登録できないこと
    it "first_name_zenkaku can not be registered unless it is within 30 characters" do
      user = build(:user, first_name_zenkaku: "あああああああああああああああああああああああああああああああ")
      user.valid?
      expect(user.errors[:first_name_zenkaku]).to include("30字以内で入力してください")
    end

    # 11. last_name_zenkakuが空では登録できないこと
    it "is invalid without a last_name_zenkaku" do
      user = build(:user, last_name_zenkaku: "")
      user.valid?
      expect(user.errors[:last_name_zenkaku]).to include("を入力してください")
    end

     # 12. last_name_zenkakuが30字以内でないと登録できないこと
    it "last_name_zenkaku can not be registered unless it is within 30 characters " do
      user = build(:user, last_name_zenkaku: "ああああああああああああああああああああああああああああああああああああ")
      user.valid?
      expect(user.errors[:last_name_zenkaku]).to include("30字以内で入力してください")
    end
      
    # 13. first_name_kanaが空では登録できないこと
    it "is invalid without a first_name_kana " do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("はカタカナで入力して下さい")
    end

    # 14. first_name_kanaがカナ文字でないと登録できないこと
    it "First_name_kana cannot be registered unless it is Kana characters " do
      user = build(:user, first_name_kana: "ああああああ")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("はカタカナで入力して下さい")
    end

    # 15. last_name_kanaが空では登録できないこと
    it "is invalid without a last_name_kana " do
      user = build(:user, last_name_kana: "")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("はカタカナで入力して下さい")
    end

    # 16. last_name_kanaがカナ文字でないと登録できないこと
    it "last_name_kana cannot be registered unless it is Kana characters " do
      user = build(:user, last_name_kana: "ああああああ")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("はカタカナで入力して下さい")
    end
 
    # 17. birthdayが空では登録できないこと
    it "is invalid without a birthday " do
      user = build(:user, birthday: "")
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください")
    end

  end