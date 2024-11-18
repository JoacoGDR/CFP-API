shared_examples 'basic index endpoint with pagination' do
  it 'succeeds' do
    expect(response).to have_http_status(:ok)
  end

  it 'paginates the response' do
    expect(response_body[collection_key.to_s].size).to eq(expected_page_size)
  end

  it 'returns page information' do
    page_keys = %w[current_page next_page prev_page total_pages total_count]
    expect(response_body['meta_data']['pages_information'].keys).to match_array(page_keys)
  end

  it 'returns the current page information' do
    expect(response_body['meta_data']['pages_information']['current_page']).to eq(page)
  end
end
