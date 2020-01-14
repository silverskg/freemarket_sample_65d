class Card < ApplicationRecord
  require 'payjp'
  Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)

  def self.create_card_to_payjp(params)
    # トークンを作成 
    token = Payjp::Token.create({
      card: {
        number:     '4242424242424242',  # ここが冒頭とは値が違います
        cvc:        '123',               # ここが冒頭とは値が違います
        exp_month:  '12',                 # ここが冒頭とは値が違います
        exp_year:   '2020'               # ここが冒頭とは値が違います
      }},
      {'X-Payjp-Direct-Token-Generate': 'true'} 
    )
    Payjp::Customer.create(card: token.id)
  end
end