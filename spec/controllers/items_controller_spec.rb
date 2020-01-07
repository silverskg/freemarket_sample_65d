require 'rails_helper'

describe ItemsController do
  let(:user) { create(:user) }
  let(:category) { create(:category) }
  let(:brand) { create(:brand) }
  # let(:params) { {
  #                 # user_id: user.id,
  #                 category_id: category.id,
  #                 # brand_id: brand.id,
  #                 name: "aaa",
  #                 status: "aaa",
  #                 body: "aaa",
  #                 deliver_fee: "aaa",
  #                 delivery_date: "aaa",
  #                 how_to_deliver: "aaa",
  #                 region: "aaa",
  #                 price: "aaa",
  #                 # images: ["aaa"]
  #                 }}
  
  let(:params) { {
                  item: attributes_for(:item),
                  user_id: user.id,
                  images: { image: [filename="8892152.jpg", filename="8892152.jpg"] }
                    }}
 
  describe '#new' do
    it "newアクションに対応したViewが遷移時に表示されること" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe '#create' do
      context 'save時' do
        it "登録成功時、カウントアップすること" do
          subject {
            post :create,
            params: params
            category = create(:category)
            brand = create(:brand)
          }
          category = create(:category)
          brand = create(:brand)
          expect{ subject }.to change(Item, :count).by(1)
          # user = create(:user)
          # expect{ create(:item, category_id: category.id, brand_id: brand.id, user_id: user.id) }.to change(Item, :count).by(1)
        end

        it "登録成功時、itemのindexに対応したページに遷移すること" do
          # item = create(:item, category_id: category.id, brand_id: brand.id, user_id: user.id)
          # binding.pry

            post :create, params: params
            # binding.pry
          expect(response).to redirect_to(root_path)
        end

      end

      context 'save失敗時' do
        it "登録失敗時、カウントアップしないこと" do
          subject {
            post :create,
            params: params
          }
          expect{ subject }.not_to change(Item, :count)
        end

        it "登録失敗時、itemのnewに対応したページにrenderで遷移すること" do
          subject
          expect(response).to render_template :new
        end

      end

  end

end