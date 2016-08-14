OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do

  provider :facebook, '1761073270776224', '1fe6cc95c224c8510905bd11754edfeb', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
  provider :google_oauth2, '59709825261-u3fbgeqsaafndno065i8tovl8ok9vpnu.apps.googleusercontent.com', '2EZTYdd7Y4K8GQ2Igkqeh625', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
