require 'rspec'
require_relative 'app'

# Check if the function read_leads_from_csv is reading the leads correctly
describe '#read_leads_from_csv' do
  it 'reads leads from a CSV file' do
    csv_file = 'lost-leads.csv'
    leads = read_leads_from_csv(csv_file)
    expect(leads.length).to eq(16)
  end
end

# Check if the function send_leads is sending the leads successfully
describe 'send_leads' do
  it 'sends leads via HTTP POST request' do
    leads = [
      {
        id: 1,
        created_time: 44065.471400463,
        ad_id: 23845439512640000,
        ad_name: 'Savol Fiat Facebook - Post01/Agosto20 (Forza Maxima - 0KM)',
        adset_id: 23845439512560000,
        adset_name: 'Savol Fiat Facebook - Post01/Agosto20 (Forza Maxima - 0KM)',
        campaign_id: 23845439511920260,
        campaign_name: 'Savol Fiat Facebook - Post01/Agosto20 (Forza Maxima - 0KM)',
        form_id: 3379216015493500,
        form_name: 'Forza Massima Varejo - Agosto20 (Facebook e Instagram)',
        is_organic: false,
        platform: 'fb',
        nome_completo: 'John Doe',
        email: 'john.doe@example.com',
        telefone: '+5511990909090'
      }
    ]
    expect { send_leads(leads) }.not_to raise_error
  end
end
