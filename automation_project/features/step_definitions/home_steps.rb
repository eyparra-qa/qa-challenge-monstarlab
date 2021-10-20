When('User clicks on laptops tap') do
    home.btn_laptops.click
end

Then('User validate that the first item is {string}') do |item_name|
    expect(home.card_item_laptop).to have_content(item_name)
end

Then('User validate that the price is {string}') do |price|
    expect(home.card_item_laptop).to have_content(price)
end