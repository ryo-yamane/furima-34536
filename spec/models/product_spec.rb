require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品登録' do
    context '商品登録ができる場合' do
      it '全ての情報があれば商品登録できる' do
        expect(@product.valid?).to eq true
      end
    end

    context '商品登録ができ無い場合' do
      it '商品名が空では登録でき無い' do
        @product.product_name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Product name can't be blank")
      end
      it '商品詳細が空では登録でき無い' do
        @product.product_explain = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Product explain can't be blank")
      end
      it 'カテゴリー選択されていなければ登録でき無い' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('Category is not a number')
      end
      it '配送料負担が選択されていなければ登録でき無い' do
        @product.deliver_fee_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('Deliver fee is not a number')
      end
      it '発送元の地域が選択されていなければ登録でき無い' do
        @product.consignor_area_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('Consignor area is not a number')
      end
      it '発送までの日にちが選択されていなければ登録でき無い' do
        @product.prepare_date_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('Prepare date is not a number')
      end
      it '販売価格が空では登録でき無い' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格は半角でないと登録でき無い' do
        @product.price = '１０００００'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end
      it '販売価格が299円以下は登録でき無い' do
        @product.price = '50'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '販売価格が10,000,000円以上は登録でき無い' do
        @product.price = '10000000000'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be less than 100000000')
      end
      it '販売価格が半角英数混合は登録でき無い' do
        @product.price = '50abs'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end
      it '販売価格が半角英語だけは登録でき無い' do
        @product.price = 'abcghr'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end
      it 'カテゴリーが『--』では登録でき無い' do
        @product.category_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include('Category must be other than 1')
      end
      it '配送料負担が『--』では登録でき無い' do
        @product.deliver_fee_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include('Deliver fee must be other than 1')
      end
      it '発送元の地域が『--』では登録でき無い' do
        @product.consignor_area_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include('Consignor area must be other than 1')
      end
      it '発送までの日にちが『--』では登録でき無い' do
        @product.prepare_date_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include('Prepare date must be other than 1')
      end
    end
  end
end
