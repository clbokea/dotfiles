# configuration for Terminal on Mac

########################
# startup path #########
########################
cd ~/Tresors/Kea/python/

##############################################
# remove catalina warning about shift to zsh #
##############################################
export BASH_SILENCE_DEPRECATION_WARNING=1

###################
# aliases #########
###################

## Python and pip
alias python='python3'
alias pip='pip3'

# Docker and sphinx python repos
alias dk_sp_html='docker run --rm -v ${PWD}:/docs sphinx:3.3.0 /bin/sh -c "cd sphinx/; make html"'
alias dk_sp_github='docker run --rm -v ${PWD}:/docs sphinx:3.3.0 /bin/sh -c "cd sphinx/; make github"'

# Jupyter Notebook
alias dk_jupiter='docker run --rm -p 8888:8888 -v ${PWD}:/home/jovyan/work clbo/jupyter'

# python container
alias dk_python='docker run -it --rm -v ${PWD}:/docs python bash'

