node[:ssh_users].each do |ssh_user|
  user_name = ssh_user[:username]

  user "create user" do
    username user_name
    create_home true
    password ssh_user[:password] if ssh_user[:password]
    uid      ssh_user[:uid]      if ssh_user[:uid]
    gid      ssh_user[:gid]      if ssh_user[:gid]
  end

  directory "/home/#{user_name}/.ssh" do
    owner user_name
    group user_name
    mode  "700"
  end

  file "/home/#{user_name}/.ssh/authorized_keys" do
    content ssh_user[:authorized_keys]
    owner   user_name
    group   user_name
    mode    "600"
  end
end
