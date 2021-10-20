Given('Call API to get all laptops') do
    @response = RestClient.post "#{URL_DEMOZABLE_API}/bycat", {'cat' => 'notebook'}.to_json, {content_type: :json, accept: :json}
end

Given('The response code is {int}') do |status|
    expect(@response.code).to have_content(status)
end

Given('Check some record in the reponse') do
    expect(@response.body).to have_content('Sony')
end