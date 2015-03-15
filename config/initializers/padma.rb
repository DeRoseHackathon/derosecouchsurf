CONTACTS_URL = case Rails.env
when 'development'
  'http://localhost:3002'
when 'staging'
  'https://padma-contacts-staging.herokuapp.com'
when 'production'
  'https://contacts.padm.am'
end
