# Doxie Dropbox Daemon

A simple daemon I run on my server to listen to the network, see if there's a Doxie scanner, and then copy any scans to a shared Dropbox folder on the server.

## Running

```sh
bundle install
ruby doxie_control.rb start
```

## License

This library is released under the [MIT License](LICENSE).
