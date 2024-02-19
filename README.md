# Lost leads recovery

This Ruby script reads leads from a CSV file and sends them back to a URL via POST request.

## Instructions

- **Make sure you have Ruby installed on your machine.**

- **Clone the Repository:**
  ```
  git clone <repository_url>
  ```

- **Installation:**
  ```
  bundle install
  ```

- **Execute the script:**
  ```
  ruby app.rb
  ```

- **Tezting:**
  ```
  rspec app_spec.rb
  ```

## Technical details

- **The script reads leads from a CSV file.**

- **It then sends the leads to the https://httpbin.org/post endpoint.**

- **The response of the request is checked to determine if the operation was successful.**

## Notes

- **Make sure you have an active internet connection when running the script.**

- **To change the input CSV file, edit the lost-leads.csv file.**
