# Rightscale::Permissions

Get all permissions across all accounts and output in CSV format.

Output is of the form account_number, account_name, email, role.

User is required to have a login and password with enterprise_manager access on the root account.  And, admin access on all accounts.

At this time, error handling is minimal; i.e. if you don't have admin access on an account the application will crash.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rightscale-permissions'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rightscale-permissions

## Usage

Usage: rightscale-permissions [options]

        --email EMAIL
                                     The RightScale email account with enterprise_manager on master account and admin on all other accounts.
        --pwd PASSWORD
                                     The RightScale password in a quoted string.
        --masterAccount ACCOUNT_ID
                                     RightScale master account id from which to retrieve all child accounts.  ex. 85729 from /api/accounts/85729
        -h, --help                   Show this help message

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/KenBridgeman/rightscale-permissions. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

