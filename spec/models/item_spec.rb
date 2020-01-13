require 'rails_helper'
describe Item do
  describe '#create' do
    it "名前がない場合のバリデーション" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("入力してください")
    end

    it "名前が41文字以上の場合のバリデーション" do
      item = build(:item, name: "０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９1")
      item.valid?
      expect(item.errors[:name]).to include("40字以内で入力してください")
    end

    it "名前が40文字の場合に登録できること" do
      category = create(:category)
      brand = create(:brand)
      user = create(:user)
      item = build(:item,
                    category_id: category.id,
                    brand_id: brand.id,
                    user_id: user.id,
                    name: "０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９")
      expect(item).to be_valid
    end

    it "状態がない場合のバリデーション" do
      item = build(:item, status: "")
      item.valid?
      expect(item.errors[:status]).to include("選択してください")
    end

    it "本文がない場合のバリデーション" do
      item = build(:item, body: "")
      item.valid?
      expect(item.errors[:body]).to include("入力してください")
    end

    it "本文が1001文字以上の場合のバリデーション" do
      item = build(:item, body: "０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９１"
                  )
      item.valid?
      expect(item.errors[:body]).to include("1000字以内で入力してください")
    end

    it "本文が1000文字の場合に登録できること" do
      category = create(:category)
      brand = create(:brand)
      user = create(:user)
      item = build(:item, 
                    category_id: category.id,
                    brand_id: brand.id,
                    user_id: user.id,
                    body: "０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９"
                  )
      expect(item).to be_valid
    end

    it "配送料の負担がない場合のバリデーション" do
      item = build(:item, deliver_fee: "")
      item.valid?
      expect(item.errors[:deliver_fee]).to include("選択してください")
    end

    it "配送予定日がない場合のバリデーション" do
      item = build(:item, delivery_date: "")
      item.valid?
      expect(item.errors[:delivery_date]).to include("選択してください")
    end

    it "配送方法がない場合のバリデーション" do
      item = build(:item, how_to_deliver: "")
      item.valid?
      expect(item.errors[:how_to_deliver]).to include("選択してください")
    end

    it "地域がない場合のバリデーション" do
      item = build(:item, region: "")
      item.valid?
      expect(item.errors[:region]).to include("選択してください")
    end

    it "価格がない場合のバリデーション" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("300以上9999999以下で入力してください")
    end

    it "価格が整数値でない場合のバリデーション" do
      item = build(:item, price: 1000.1)
      item.valid?
      expect(item.errors[:price]).to include("300以上9999999以下で入力してください")
    end

    it "価格が300以下の場合のバリデーション" do
      item = build(:item, price: 299)
      item.valid?
      expect(item.errors[:price]).to include("300以上9999999以下で入力してください")
    end

    it "価格が300以上の場合に登録できること" do
      category = create(:category)
      brand = create(:brand)
      user = create(:user)
      item = build(:item,
                    category_id: category.id,
                    brand_id: brand.id,
                    user_id: user.id,
                    price: 300
                    )
      expect(item).to be_valid
    end

    it "価格が10000000以下の場合に登録できること" do
      category = create(:category)
      brand = create(:brand)
      user = create(:user)
      item = build(:item,
                    category_id: category.id,
                    brand_id: brand.id,
                    user_id: user.id,
                    price: 9999999
                    )
      expect(item).to be_valid
    end

    it "価格が10000000以上の場合のバリデーション" do
      item = build(:item, price: 10000000)
      item.valid?
      expect(item.errors[:price]).to include("300以上9999999以下で入力してください")
    end

    it "カテゴリーがない場合のバリデーション" do
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("選択してください")
    end

    it "ブランドがない場合のバリデーション" do
      item = build(:item, brand_id: "")
      item.valid?
      expect(item.errors[:brand_id]).to include("選択してください")
    end

    it "画像がない場合のバリデーション" do
      item = build(:item, include_image: "")
      item.valid?
      expect(item.errors[:include_image]).to include("画像がありません")
    end

    it "全てのパラメーターがある状態に登録できること" do
      category = create(:category)
      brand = create(:brand)
      user = create(:user)
      item = build(:item,
                    category_id: category.id,
                    brand_id: brand.id,
                    user_id: user.id,
                    )
      expect(item).to be_valid
    end

  end
end