require 'csv'
require 'net/http'
require 'json'

# Function to read the leads from the CSV file
def read_leads_from_csv(csv_file)
  leads = []
  CSV.foreach(csv_file, headers: true) do |row|
    lead = {
      id: row['id'].to_i,
      created_time: row['created_time'].to_f,
      ad_id: row['ad_id'].to_i,
      ad_name: row['ad_name'],
      adset_id: row['adset_id'].to_i,
      adset_name: row['adset_name'],
      campaign_id: row['campaign_id'].to_i,
      campaign_name: row['campaign_name'],
      form_id: row['form_id'].to_i,
      form_name: row['form_name'],
      is_organic: row['is_organic'] == 'true',
      platform: row['platform'],
      nome_completo: row['nome_completo'],
      email: row['email'],
      telefone: row['telefone']
    }
    leads << lead
  end
  leads
end

# Funtion to send the leads via POST HTTP request
def send_leads(leads)
  url = URI('https://httpbin.org/post')
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = (url.scheme == "https")

  request = Net::HTTP::Post.new(url.path, 'Content-Type' => 'application/json')
  request.body = leads.to_json

  response = http.request(request)
end

# Read leads from the CSV file
leads = read_leads_from_csv('lost-leads.csv')

# Send leads via POST HTTP request
response = send_leads(leads)

# Check if the request was successful and print the result
if response.code == '200'
  puts 'POST request successful'
else
  puts 'POST request failed'
end
