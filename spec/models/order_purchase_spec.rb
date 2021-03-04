require 'rails_helper'

RSpec.describe OrderPurchase, type: :model do
  describe '購入者情報の保存' do
    before do
      user = FactoryBot.create(:user)
      product = FactoryBot.create(:product)
      @order_purchase = FactoryBot.build(:order_purchase, user_id: user.id, product_id: product.id)
       sleep 1
    end

    context '商品購入ができる時' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_purchase.valid?).to eq true
      end
      it 'building_nameが空でも保存できること' do
        @order_purchase.building_name = ""
        expect(@order_purchase).to be_valid
      end    
    end
    
    context '商品購入ができない時'do
    it 'post_codeが空だと保存できないこと' do
      @order_purchase.post_code = ""
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Post code can't be blank")
    end
    it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_purchase.post_code = "1111111"
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Post code is invalid")
    end
    it 'consignor_areaを選択していないと保存できないこと' do
      @order_purchase.consignor_area_id = "1"
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Consignor area must be other than 1")
    end
    it 'city_townが空では保存できないこと' do
      @order_purchase.city_town = ""
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("City town can't be blank")
    end
    it 'numberは空では保存できない' do
      @order_purchase.number = ""
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Number can't be blank")
    end
    
    it 'phone_numberが空だと保存できないこと' do
      @order_purchase.phone_number = ""
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号が１２桁以上では登録できない'do
      @order_purchase.phone_number = "123456789012"
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end
    it '電話番号が英数混合では登録できない'do
      @order_purchase.phone_number = "1234qqqq"
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Phone number is not a number")
    end
    it 'user_idが空では登録できない'do
      @order_purchase.user_id = ""
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("User can't be blank")
    end
    it 'product_idが空では登録できない'do
      @order_purchase.product_id = ""
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Product can't be blank")
    end
    it 'tokenが空では登録できない'do
      @order_purchase.token = ""
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Token can't be blank")
    end
  end
 end
end