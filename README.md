# Rightscale::Permissions

Get all permissions across all accounts and output in CSV format.

Output is of the form account_number, account_name, email, role.

User is required to have a login and password with enterprise_manager access on the root account.  And, admin access on all accounts.

At this time, error handling is minimal; i.e. if you don't have admin access on an account the application will crash.


## Installation

At this time the app has not been added as a gem, so simply check out of the repo, run `bin/setup` to install dependencies.  
Then invoke the rightscale-permissions script.

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

After checking out the repo, run `bin/setup` to install dependencies. 

## Contributing

Bug reports and pull requests are NOT welcome on GitHub at https://github.com/KenBridgeman/rightscale-permissions. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
Seriously, I don't have time.

## License

Reuse the code.  I don't care.
