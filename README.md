# Sync Party Docker

A docker container, setup script and collection of helpers for [Sync Party](https://github.com/steeelydan/sync-party)

## Automatic installation

Requirements:

- Ubuntu of some form with bash
- A domain name connected to that server for lets encrypt

```sh
# Make sure you are running this as root
bash <(curl -s https://raw.githubusercontent.com/trickypr/sync-party-docker/main/scripts/bootstrap.sh)
```

This will install a lot of stuff. You will be prompted a few times when setting up Docker & Lets encrypt.

## Utilities

- `sync-party`: Equivalent to `npm run cli`
- `sync-party-users [USERS SPACE SEP]`: Creates accounts with random passwords for a list of users
- `sync-party-admins [ADMINS SPACE SEP]`: Creates admin accounts with random passowords. Only admins can open rooms.
