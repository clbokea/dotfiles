# configuration for Terminal on Mac

########################
# startup path #########
########################
# cd ~/Tresors/Kea/python/

##############################################
# remove catalina warning about shift to zsh #
##############################################
export BASH_SILENCE_DEPRECATION_WARNING=1
PS1="iclbo:\W \u\$ "

###################
# aliases #########
###################

## Python and pip
alias python='python3'
alias pip='pip3'

# Docker and sphinx python repos
alias dk_sp_html='docker run --rm -v ${PWD}:/docs clbo/sphinx:7.1.2 make html'
alias dk_sp_github='docker run --rm -v ${PWD}:/docs clbo/sphinx:7.1.2 make github'

# Jupyter Notebook
alias dk_jupyter='docker run --name jupyter -p 8888:8888 -v ${PWD}:/home/jovyan/work clbo/jupyter:6.5.4'

# python container
alias dk_python='docker run -it --rm -v ${PWD}:/docs python:3.10.1 bash'

# CD into python/repos/spring2024
alias cdpy='cd ~/Tresors/Kea/python/repos/spring2024'

# CD into tech/repos
alias cdte='cd ~/Tresors/Kea/tech/repos'

# CD into ita
alias cdita='cd ~/Tresors/Kea/ITA/'

PATH="/usr/local/bin:$PATH"
eval "$(/opt/homebrew/bin/brew shellenv)"

