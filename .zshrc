# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="gnzh"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

PATH=$HOME/.local/bin:$HOME/bin:/opt/imc/bazelisk/bin:$PATH
export PATH

LM_LICENSE_FILE=$LM_LICENSE_FILE:20010@chcss015
export LM_LICENSE_FILE

FALCON_PCAP_DIR=/home/falcon_unit_tests/
export FALCON_PCAP_DIR

PATH_TO_FPGA_TOOLS=/home/eda
export PATH_TO_FPGA_TOOLS

export LD_LIBRARY_PATH='/opt/imc/gcc-7.3.0/lib64':$LD_LIBRARY_PATH

function tc_cert()
{
    cds
    sudo $JAVA_HOME/bin/keytool -keystore $JAVA_HOME/jre/lib/security/cacerts  -storepass changeit -importcert -file /etc/pki/ca-trust/source/anchors/CAIMC01.pem -alias caimc01
    sudo $JAVA_HOME/bin/keytool -keystore $JAVA_HOME/jre/lib/security/cacerts  -storepass changeit -importcert -file /etc/pki/ca-trust/source/anchors/CAIMC02.pem -alias caimc02
    sudo $JAVA_HOME/bin/keytool -keystore $JAVA_HOME/jre/lib/security/cacerts  -storepass changeit -importcert -file /etc/pki/ca-trust/source/anchors/CATRADING05.pem -alias catrading05
}

function alint()
{
    bazel build :alint_FALCON_${1} --action_env=ALINT_COMMAND=/home/eda/aldec/ALINT-PRO-2018.05-EA10.7-x64/runalintprocon
}

cd () { builtin cd "$@"; ls; }

function lint()
{
    cd ~
    cd fpga/Falcon/hw/linting/verilator/
    ./lint_target.sh ../../target/verilator_lint/target/${1}.vc
}
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation

export FALCON_REPO="~/git/fpga"
alias sublime=/opt/sublime_text/sublime_text

alias localDev="mvn clean install -pl localDev -am -T C1 -PlocalDev"
alias cdt="cd ${FALCON_REPO}/Falcon/localDev/target"
alias cdf="cd ${FALCON_REPO}/Falcon"
alias cds="cd ${FALCON_REPO}/scripts"

alias cdg="cd ~/"
alias cdp='cd ~/peregrine'
alias cdr='cd ~/git/roadrunner'
alias cdw="cd ${FALCON_REPO}/Falcon/hwTest/ethernet/eth_frame_decoder/cvm"

alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias .1='cd ../'                           # Go back 1 directory level
alias .2='cd ../../'                        # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels

alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias rmvcd='rm *.vcd'

alias pull='git pull --rebase'
alias push='git push'
alias git_ghost='git clean -X -n'
alias git_clean_ghost='git clean -X -fd'
alias spinf="cd /export/home/wparkins/git/docker_spinup; SPINUP_CONFIG='will/spin_up_custom.sh' ./spinup shell"
alias spinr="cd /export/home/wparkins/git/docker_spinup; SPINUP_CONFIG='will/rr_spinup.sh' ./spinup shell"
#source "${FALCON_REPO}/Falcon/bazel/scripts/user_setup.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

pathadd() {
    newelement=${1%/}
    if [ -d "$1" ] && ! echo $PATH | grep -E -q "(^|:)$newelement($|:)" ; then
        if [ "$2" = "after" ] ; then
            PATH="$PATH:$newelement"
        else
            PATH="$newelement:$PATH"
         fi
    fi
}

pathrm() {
    PATH="$(echo $PATH | sed -e "s;\(^\|:\)${1%/}\(:\|\$\);\1\2;g" -e 's;^:\|:$;;g' -e 's;::;:;g')"
}
pathadd "/opt/imc/git/bin"
