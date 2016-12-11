# mitamae-plugin-recipe-ssh_users

Mitamae plugin which configures users and ssh_keys.

## Installation

```bash
$ mkdir plugins
$ git clone --depth 1 https://github.com/toshimaru/mitamae-plugin-recipe-ssh_users plugins/mitamae-plugin-recipe-ssh_users
```

## Usage

### Recipe

`recipe.rb`:

```rb
include_recipe 'ssh_users'
```

### Node Sample

`node.yml`:

```yaml
ssh_users:
  - username: "toshimaru"
    uid: 2000
    authorized_keys: |
      ssh-ed25519 YOUR_PUBLIC_AUTHORIZED_KEYS
  - username: "foo"
    password: "1234"
    gid: 1001
    uid: 2001
    authorized_keys: "PUBLIC_AUTHORIZED_KEY"
  - username: "bar"
```

### Apply mitamae recipe

```
$ mitamae local recipe.rb -y node.yml
```

## Tips

### How to generate password for user

```
$ gem install unix-crypt
$ mkunixcrypt -s "salt"
Enter password:
Verify password:
$6$salt$...
```

## TODO

- apply shell configuration
- more README
