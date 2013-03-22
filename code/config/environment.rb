# Load the rails application
require File.expand_path('../application', __FILE__)

# Load my secret settings
SECRET = YAML.load_file("#{Rails.root}/config/secrets.yml")
raise 'Please update /config/secrets.yml with you own settings' if SECRET['self_destruct']

# Initialize the rails application
Myapp::Application.initialize!