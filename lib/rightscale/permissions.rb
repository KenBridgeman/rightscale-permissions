require_relative "permissions/version"

require 'right_api_client'
require 'ruby-progressbar'
require 'optparse'



def processOptions

  OptionParser.new do |parser|

    parser.on("", "--email EMAIL", "The RightScale email account with enterprise_manager on master account and admin on all other accounts.") do |email|
      @options[:email] = email
    end

    parser.on("", "--pwd PASSWORD", "The RightScale password in a quoted string.") do |pwd|
      @options[:password] = pwd
    end

 #   parser.on("-r", "--refreshToken TOKEN", "The RightScale OAuth refresh token") do |refreshToken|
 #     @options[:refreshToken] = refreshToken
 #   end

    parser.on("", "--masterAccount ACCOUNT_ID", "RightScale master account id from which to retrieve all child accounts.  ex. 85729 from /api/accounts/85729") do |masterAccount|
      @options[:masterAccount] = masterAccount
    end

    parser.on("-h", "--help", "Show this help message") do ||
      puts parser
      exit
    end
  end.parse!
end

# method output_all_permissions_in_account

def output_all_permissions_in_account(account)

  # Get the account href (since there are 3 hrefs I'm not actually sure how this works )
  # and pull the account number of the end.  /api/account/85729
  account_number = account.href.split('/').last.to_i

  # Log in to the child account.  Makes a RightScale API call.
  client = RightApi::Client.new(:email => @options[:email], :password => @options[:password], :account_id => account_number)


  # RightScale API call to get client permissions.
  # pulled into a variable so that we aren't making this call multiple times.
  client_permissions = client.permissions.index

  cnt = client_permissions.length

  begin
    retries ||=0
    client_permissions.each do |p|

      # RightScale API call following /api/user href off of the permission.
      user_email = p.user.show.email

      puts "#{account_number}, #{account.name}, #{user_email}, #{p.role_title}"
      p = nil
      # counting user permissions to go in this account.
      cnt = cnt - 1

    end
  rescue
    # Had some networking errors so added a retry.  Not sure if it will work.
    puts "Retry: #{retries}"
    retry if (retries +=1) < 4
  end

end


# MAIN APPLICATION CODE
@options = {}

processOptions


# Log in to the Master Account.  Makes a RightScale API call.

@client = RightApi::Client.new(:email => @options[:email], :password => @options[:password], :account_id => @options[:masterAccount])

# Get the list of CHILD_ACCOUNTS.  Makes a RightScale API call.
@child_accounts = @client.child_accounts.index

@num_child_accounts = @child_accounts.length

if STDOUT.tty?
  # If CSV output is going to terminal, then send progress bar to NULL to ensure clean screen.
  PBOUT = File.open(File::NULL, 'w')
else
  PBOUT = STDERR
end

# Puts a nice progress bar and ETA on STDERR (the screen) to set expectations for this long running query.
progressbar = ProgressBar.create(:total => @num_child_accounts, :format => "%a %e  %c/%C  %p%%  [%B]", :output => PBOUT)

# Output the CSV file header.
puts "Account, Account.Name, User.Email, Role"

# For each child_account, output the user and role.
#    NOTE: Typically a user has more than one role on an account, resulting in more than one record.

@child_accounts.each do | account |

  output_all_permissions_in_account(account)

  # Display progress 1 .. @num_child_accounts
  progressbar.increment
end






