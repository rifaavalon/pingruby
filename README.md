# PING RUBY

This is an app that I setup for a presentation.

It's just a fun little thing and it could be useful to someone if they wanted to
get their IP address on their Raspberry Pi, Docker container, or Compute instance
on whatever cloud provider you are using.

## Setup
### Requirements

* Ruby-2.4
* Bundler
* RubyGems
* Preferably a nix based system

I have included a Dockerfile that should work if you want to containerize the app.

Setup an account with [Twilio](www.twilio.com)

Inject your 'account_sid' and 'auth_token' in the code along with your phone numbers
in the from and to parts. The 'from' number should be the number that was supplied
from Twilio once you setup your account.

'To:' number should be the number that you want to send the text message to.

The output will show you the IP address and the time it took to ping google,
as well as if there were any packets dropped.

If you want to run this just for fun type in 'ruby ping.rb' in the folder.

I have included a simple script if you want to turn this into a commandline application
then run it as a cron job, or a Packer job to let you know that the system is up and running, etc. 
