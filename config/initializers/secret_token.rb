# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end
# SampleApp::Application.config.secret_key_base = 'c1d394cd873776fa561bd067c84e58f8d8db47d169529bf7667dc403c0f69f2414c6b6ecef7686887113d03e789ff3b121dd4fcb4c3c4be65e617179d04c4989'
SampleApp::Application.config.secret_key_base = secure_token

