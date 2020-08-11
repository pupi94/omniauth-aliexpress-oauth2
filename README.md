# OmniAuth Aliexpress
Aliexpress OAuth2 Strategy for OmniAuth

## Installation
Add to your Gemfile:

```ruby
gem 'omniauth-aliexpress-oauth2'
```
Then `bundle install`.

## Usage

`OmniAuth::Strategies::Aliexpress` is simply a Rack middleware. Read [the OmniAuth docs](https://github.com/intridea/omniauth) for detailed instructions.

Here's a quick example, adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :aliexpress, ENV['API_KEY'], ENV['APP_SECRET']
end
```
Authenticate the user by having them visit /auth/aliexpress. For example:

```html
<a href="/auth/aliexpress">Authenticate</a>
```

## Authentication Hash

Here's an example *Authentication Hash* available in `request.env['omniauth.auth']`:

```ruby
{
  provider: 'aliexpress',
  credentials: {
    token: "token",
    refresh_token: "refresh token",
    expires_at: 1590227513,
    refresh_token_expires_at: 1590227513
  },
  info: {
    user_nick: "user nick",
    user_id: "user id",
    locale: "locale",
    sp: "sp"
  },
  extra: {
    w1_expires_at: 1590227513,
    w2_expires_at: 1590227513,
    r1_expires_at: 1590227513,
    r2_expires_at: 1590227513
  }
}
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
