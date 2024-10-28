#### hey, this discord cli looks cool - install it https://github.com/ayn2op/discordo  
> https://github.com/ayn2op/discordo  
> Add URL to the chat? (Y)es/(N)o/(D)on't ask again [Yes]: y  
> Scraping https://github.com/ayn2op/discordo...  
> ... done.  

To install the Discord CLI tool `discordo`, you can follow these steps:

1. Clone the repository.
2. Build the project.
3. Install the binary.

Here are the shell commands to do this:

```bash
git clone https://github.com/ayn2op/discordo.git
cd discordo
make build
sudo make install
```

This will clone the repository, build the project, and install the `discordo` binary on your system.

> Tokens: 4.2k sent, 95 received. Cost: $0.01 message, $0.01 session.  
> git clone https://github.com/ayn2op/discordo.git
cd discordo                                     
make build                                      
sudo make install  
> Run shell commands? (Y)es/(N)o/(D)on't ask again [Yes]: y  
> Running git clone https://github.com/ayn2op/discordo.git  
> Running cd discordo  
> Running make build  
> Running sudo make install  
> Add command output to the chat? (Y)es/(N)o/(D)on't ask again [Yes]: y  

#### .  

It seems like the `make build` command is not available in the `discordo` repository, and the `sudo` command is not found on your system. Let's try a different approach to install `discordo`.

You can use the Go toolchain to build and install `discordo` directly. Here are the steps:

1. Ensure you have Go installed on your system.
2. Use the `go install` command to build and install `discordo`.

Here are the shell commands to do this:

```bash
cd discordo
go install
```

This will build and install the `discordo` binary in your Go workspace's `bin` directory. Make sure your `GOPATH/bin` is in your system's `PATH` to run `discordo` from anywhere.

> Tokens: 12k sent, 162 received. Cost: $0.03 message, $0.04 session.  
> cd discordo
go install  
> Run shell commands? (Y)es/(N)o/(D)on't ask again [Yes]: y  
> Running cd discordo  
> Running go install  
> Add command output to the chat? (Y)es/(N)o/(D)on't ask again [Yes]: y  

#### .  

It seems that the `go` command is not found on your system, which indicates that Go is not installed. To proceed, you need to install Go first. Here are the steps to install Go on your system:

1. Download the Go binary for your system from the official Go website.
2. Extract the archive to `/usr/local`.
3. Add Go to your system's `PATH`.

Here are the shell commands to do this:

```bash
wget https://go.dev/dl/go1.21.1.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.21.1.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
```

After installing Go, you can proceed with building and installing `discordo` using the `go install` command.

> Tokens: 12k sent, 172 received. Cost: $0.03 message, $0.08 session.  
> wget https://go.dev/dl/go1.21.1.linux-amd64.tar.gz     
sudo tar -C /usr/local -xzf go1.21.1.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin  
> Run shell commands? (Y)es/(N)o/(D)on't ask again [Yes]: y  
> Running wget https://go.dev/dl/go1.21.1.linux-amd64.tar.gz  
> Running sudo tar -C /usr/local -xzf go1.21.1.linux-amd64.tar.gz  
> Running export PATH=$PATH:/usr/local/go/bin  
> Add command output to the chat? (Y)es/(N)o/(D)on't ask again [Yes]: y  

#### .  

It seems that both `wget` and `sudo` are not available on your system. Let's try using `curl` to download Go, and then extract it without `sudo` if you have the necessary permissions. If `curl` is also unavailable, you may need to install it first.

Here are the steps to download and install Go using `curl`:

1. Use `curl` to download the Go binary.
2. Extract the archive to a directory you have write access to, such as your home directory.
3. Add Go to your system's `PATH`.

Here are the shell commands to do this:

```bash
curl -O https://go.dev/dl/go1.21.1.linux-amd64.tar.gz
tar -C $HOME -xzf go1.21.1.linux-amd64.tar.gz
export PATH=$PATH:$HOME/go/bin
```

If `curl` is not available, you will need to install it first. Let me know if you encounter any issues with these steps.

> Tokens: 12k sent, 213 received. Cost: $0.03 message, $0.11 session.  
> curl -O https://go.dev/dl/go1.21.1.linux-amd64.tar.gz
tar -C $HOME -xzf go1.21.1.linux-amd64.tar.gz        
export PATH=$PATH:$HOME/go/bin  
> Run shell commands? (Y)es/(N)o/(D)on't ask again [Yes]: y  
> Running curl -O https://go.dev/dl/go1.21.1.linux-amd64.tar.gz  
> Running tar -C $HOME -xzf go1.21.1.linux-amd64.tar.gz  
> Running export PATH=$PATH:$HOME/go/bin  
> Add command output to the chat? (Y)es/(N)o/(D)on't ask again [Yes]: y  

#### <blank>  

#### .  

It seems that essential tools like `curl`, `wget`, and `sudo` are not available on your system. To proceed, you will need to install these tools or find an alternative way to download and install software.

If you have access to a package manager like `apt`, `yum`, or `pacman`, you can use it to install these tools. Here are some example commands for different package managers:

For `apt` (Debian/Ubuntu-based systems):
```bash
apt update
apt install wget curl sudo
```

For `yum` (RHEL/CentOS-based systems):
```bash
yum install wget curl sudo
```

For `pacman` (Arch-based systems):
```bash
pacman -S wget curl sudo
```

If you don't have access to a package manager, you might need to contact your system administrator or use another method to install these tools. Let me know how you would like to proceed!

> Tokens: 13k sent, 194 received. Cost: $0.03 message, $0.14 session.  
> apt update                
apt install wget curl sudo  
