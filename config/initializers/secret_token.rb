# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
Prelaunchr::Application.config.secret_token = ENV["RAILS_SECRET"] || '91272f70e03cdb38bba5e095b04324de8bcfe3007e7824032dd9adff77d361f81cd3a38e8acae4fac7bbe08e0866b419e1d058c10ff3d38f8ca128445eaf66e5'