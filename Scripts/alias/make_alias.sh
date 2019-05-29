#!/bin/zsh

. ~/.zshrc
echo "#!/bin/zsh" > ~/.alias.sh
alias | awk -F'[ =]' '{print $1}' >> ~/.alias.sh
