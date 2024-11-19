shared_examples 'basic create endpoint' do
  it 'responds with created' do
    subject
    expect(response).to have_http_status(:created)
  end

  it 'creates a new record' do
    expect { subject }.to change(model, :count).by(1)
  end

  it 'returns the url of the new record' do
    subject
    expect(response_body['url']).to eq(url)
  end
end
