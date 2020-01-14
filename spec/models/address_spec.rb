require 'rails_helper'
describe Address do
  describe '#step5' 
  # 1. first_name_zenkakuが空では登録できないこと
  it "is invalid without a first_name_zenkaku" do
    address = build(:address, first_name_zenkaku: nil)
    address.valid?
    expect(address.errors[:first_name_zenkaku]).to include("を入力してください")
  end

  # 2. first_name_zenkakuが30字以内でないと登録できないこと
  it "first_name_zenkaku can not be registered unless it is within 30 characters" do
    address = build(:address, first_name_zenkaku: "あああああああああああああああああああああああああああああああ")
    address.valid?
    expect(address.errors[:first_name_zenkaku]).to include("30字以内で入力してください。")
  end

  # 3. last_name_zenkakuが空では登録できないこと
  it "is invalid without a last_name_zenkaku" do
    address = build(:address, last_name_zenkaku: "")
    address.valid?
    expect(address.errors[:last_name_zenkaku]).to include("を入力してください")
  end

   # 4. last_name_zenkakuが30字以内でないと登録できないこと
  it "last_name_zenkaku can not be registered unless it is within 30 characters " do
    address = build(:address, last_name_zenkaku: "ああああああああああああああああああああああああああああああああああああ")
    address.valid?
    expect(address.errors[:last_name_zenkaku]).to include("30字以内で入力してください。")
  end
    
  # 5. first_name_kanaが空では登録できないこと
  it "is invalid without a first_name_kana " do
    address = build(:address, first_name_kana: "")
    address.valid?
    expect(address.errors[:first_name_kana]).to include("はカタカナで入力して下さい。")
  end

  # 6. first_name_kanaがカナ文字でないと登録できないこと
  it "First_name_kana cannot be registered unless it is Kana characters " do
    address = build(:address, first_name_kana: "ああああああ")
    address.valid?
    expect(address.errors[:first_name_kana]).to include("はカタカナで入力して下さい。")
  end

  # 7. last_name_kanaが空では登録できないこと
  it "is invalid without a last_name_kana " do
    address = build(:address, last_name_kana: "")
    address.valid?
    expect(address.errors[:last_name_kana]).to include("はカタカナで入力して下さい。")
  end

  # 8. last_name_kanaがカナ文字でないと登録できないこと
  it "last_name_kana cannot be registered unless it is Kana characters " do
    address = build(:address, last_name_kana: "ああああああ")
    address.valid?
    expect(address.errors[:last_name_kana]).to include("はカタカナで入力して下さい。")
  end

  # 9. post_numberが空では登録できないこと
  it "is invalid without a post_number " do
    address = build(:address, post_number: "")
    address.valid?
    expect(address.errors[:post_number]).to include("を入力してください")
  end

  # 9. post_numberが7文字以上では登録できないこと
  it "is invalid without a post_number " do
    address = build(:address, post_number: "12345678")
    address.valid?
    expect(address.errors[:post_number]).to include("7文字で入力してください。")
  end

  # 10. prefecturesが空では登録できないこと
  it "is invalid without a prefectures " do
    address = build(:address, prefectures: "")
    address.valid?
    expect(address.errors[:prefectures]).to include("を入力してください")
 end

 # 11. cityが空では登録できないこと
 it "is invalid without a city " do
  address = build(:address, city: "")
  address.valid?
  expect(address.errors[:city]).to include("を入力してください")
end

# 11. cityが75文字以上では登録できないこと
it "is invalid without a city " do
  address = build(:address, city: "12345678901234567890123456789012345678901234567890123456789012345678901234567890")
  address.valid?
  expect(address.errors[:city]).to include("は75文字以内で入力してください")
end

# 12. addresses_banchiが75文字以上では登録できないこと
it "is invalid without a city " do
  address = build(:address, addresses_banchi: "")
  address.valid?
  expect(address.errors[:addresses_banchi]).to include("を入力してください")
end

# 13. build_nameが30文字以上では登録できないこと
it "is invalid without a city " do
  address = build(:address, build_name: "1234567890123456789012345667789123456788901234")
  address.valid?
  expect(address.errors[:build_name]).to include("の入力が正しくありません")
end

# 14. phone_numberが11文字以上では登録できないこと
it "is invalid without a city " do
  address = build(:address, phone_number: "1234567890123456789012345667789123456788901234")
  address.valid?
  expect(address.errors[:phone_number]).to include("の入力が正しくありません")
end


end