#!/bin/bash

#31: Red
#32: Green
#33: Yellow
#34: Blue
#35: Magenta
#36: Cyan

# Function to display colored text
print_color() {
    COLOR=$1
    TEXT=$2
    echo -e "\e[${COLOR}m${TEXT}\e[0m"
}

# Function for colored read command
read_color() {
    COLOR=$1
    PROMPT=$2
    shift 2
    echo -e "\e[${COLOR}m${PROMPT}\e[0m"
    read "$@"
}

# Function press any key to continue
press_any_key() {
    echo -e "\e[36mPress any key to continue...\e[0m"
    read -n 1 -s  # -n 1 reads 1 character, -s hides the input
}


# Function check if Korean
check_korean_support() {
    if locale -a | grep -q "ko_KR.utf8"; then
        return 0  # Korean support is installed
    else
        return 1  # Korean support is not installed
    fi
}

# Install KOREAN if not 
if check_korean_support; then
    print_color "36" "한글있긔 설치넘기긔."
else
    print_color "36" "Installing Korean language support..."
    sudo apt-get install language-pack-ko -y
    sudo locale-gen ko_KR.UTF-8
    sudo update-locale LANG=ko_KR.UTF-8 LC_MESSAGES=POSIX
    print_color "36" "한글설치완료"
fi




# 
print_color "32" "sudo apt update && sudo apt upgrade -y"
sudo apt update && sudo apt upgrade -y
print_color "32" "sudo apt -qy install curl git jq lz4 build-essential screen"
sudo apt -qy install curl git jq lz4 build-essential screen
print_color "32" "sudo apt autoremove -y"
sudo apt autoremove -y



# Set username
USERNAME="hluser"
# password 1234
PASSWORD="1234"



# Create user with home directory
useradd -m -s /bin/bash $USERNAME

# Set password
echo "$USERNAME:$PASSWORD" | chpasswd


sudo usermod -aG sudo $USERNAME
sudo usermod -aG docker $USERNAME
echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" | sudo EDITOR='tee -a' visudo

print_color "32" "hluser 생성, sudo 권한 부여."



print_color "32" "Hyperliquid node 설치"
sudo -u $USERNAME bash << EOF
cd /home/$USERNAME
echo '{"chain": "Testnet"}' > ~/visor.json
curl https://binaries.hyperliquid.xyz/Testnet/hl-visor > ~/hl-visor && chmod a+x ~/hl-visor
EOF
print_color "31" "이제 hluser에서 ~/hl-visor run-non-validator 커맨드로 노드를 실행할 수 있습니다." 



print_color "31" "hluser로 접속, su - hluser" 
print_color "32" "스크린을 만들고, screen -S hl" 
print_color "33" "노드 실행커맨드, ~/hl-visor run-non-validator" 
print_color "34" "깃헙 확인" 
print_color "36" "깃헙 확인" 
press_any_key



exec bash

