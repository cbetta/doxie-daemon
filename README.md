# Doxie Dropbox Daemon

A simple daemon I run on my server to listen to the network, see if there's a Doxie scanner, and then copy any scans to a shared Dropbox folder on the server.

## Running

```rb
bundle install
run doxie_control.rb start
```
