RSpec.shared_examples 'success response' do |parameter|
  it 'returns http success' do
    expect(response).to have_http_status(:success)
  end
end
