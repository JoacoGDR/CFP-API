shared_examples 'basic show endpoint' do
  it 'succeeds' do
    expect(response).to have_http_status(:ok)
  end

  it 'returns expected keys' do
    expect(response_body.keys).to match_array(expected_keys)
  end
end
