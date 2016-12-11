# mitamae-plugin-recipe-ssh_users

## Installation

TODO

## Usage

### Recipe

```rb
include_recipe 'ssh_users'
```

### Node

```yaml
ssh_users:
  - username: "toshimaru"
    password: "1234"
    # gid: 1000
    # uid: 2000
    shell: "/bin/bash"
    authorized_keys: |
      ssh-ed25519 YOUR_AUTHORIZED_KEYS
  - username: "foo"
    password: "1234"
    # gid: 1000
    # uid: 2001
    authorized_keys: "authorized_keys"
    shell: "/bin/bash"
  - username: "bar"
    password: "1234"
    # gid: 1000
    # uid: 2003
    shell: "/bin/bash"
    authorized_keys: "authorized_keys"
```

## How to generate password

```
$ gem install unix-crypt
$ mkunixcrypt -s "salt"
Enter password:
Verify password:
$6$salt$...
```
