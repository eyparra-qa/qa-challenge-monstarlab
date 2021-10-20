# frozen_string_literal: true

class Home < SitePrism::Page
    element :btn_laptops, :xpath, '/html/body/div[5]/div/div[1]/div/a[3]'
    element :card_item_laptop, :xpath, '/html/body/div[5]/div/div[2]/div/div[1]/div/div'
end