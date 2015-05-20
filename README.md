# CSCI 465 - Web Programming Fundamentals
Self Taught Home Page: http://www.ecst.csuchico.edu/~tyson/classes/465.f14/

## I. INSTALLATION
#### 1. Remove Existing Installation
1. Uninstall All Gems
  ```
  $ gem update --system
  $ gem uninstall -aIx
  ```

2. Uninstall rvm
  ```
  $ rvm implode
  $ rm -rf /etc/rvmrc ~/.rvmrc
  ```

3. Remove rvm references in .bashrc .bash_profile .profile and .zshrc

#### 2. Installation
1. Ruby and the Ruby Version Manager (rvm)
  ```
  $ sudo apt-get update
  $ sudo apt-get install curl
  $ \curl -L https://get.rvm.io | bash -s stable --ruby
  ```

2. Install rails (it may take a while) and a javascript runtime environment
3. Install the git version control system
