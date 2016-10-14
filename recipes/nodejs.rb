# Instal newest Nodejs
bash "install_nodejs" do
     user "root"
     cwd "/tmp"
     code <<-EOH
        curl --silent --location https://deb.nodesource.com/setup_6.x | sudo bash -
        apt-get install --yes nodejs
     EOH
     not_if { ::File.exists?('/usr/bin/nodejs') }
end

# Install npm packages globally without sudo on macOS and Linux
bash "fix_npm_nosudo" do
     user "root"
     cwd "/tmp"
     code <<-EOH
        wget -O- https://raw.githubusercontent.com/glenpike/npm-g_nosudo/master/npm-g-nosudo.sh | sh
     EOH
end

# Install Node Version Manager
bash "install_nvm" do
     user "root"
     cwd "/tmp"
     code <<-EOH
        curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.7/install.sh | bash
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
     EOH
     not_if { ::File.exists?('$HOME/.nvm') }
end
