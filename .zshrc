# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="af-magic"
# ZSH_THEME="${ZSH_THEME:=random}"
# : "${ZSH_THEME:=random}"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
ZSH_THEMES_LIKED=( "zhann" "garyblessington" "clean" "af-magic" "sunrise" "refined" "mh" "dpoggi" "adben" "steeef" "norm" "geoffgarside" )

# ZSH_THEME_RANDOM_CANDIDATES=( "3den" "adben" "af-magic" "afowler" "amuse" "apple" "arrow" "aussiegeek" "avit" "awesomepanda" "blinks" "bureau" "candy" "candy-kingdom" "clean" "cloud" "crcandy" "cypher" "daveverwer" "dieter" "dpoggi" "dst" "dstufft" "duellj" "edvardm" "essembeh" "evan" "fino" "fishy" "flazz" "fletcherm" "fox" "frisk" "frontcube" "fwalch" "gallifrey" "garyblessington" "gentoo" "geoffgarside" "gianu" "gnzh" "gozilla" "half-life" "intheloop" "itchy" "jaischeema" "jbergantine" "jispwoso" "jnrowe" "jonathan" "josh" "jtriley" "juanghurtado" "kafeitu" "kardan" "kennethreitz" "kiwi" "kolo" "kphoen" "lambda" "lukerandall" "macovsky-ruby" "maran" "mgutz" "mh" "michelebologna" "mikeh" "miloshadzic" "mira" "mlh" "mrtazz" "muse" "norm" "obraun" "peepcode" "philips" "pmcgee" "pygmalion" "pygmalion-virtualenv" "random" "re5et" "refined" "rgm" "risto" "rkj" "rkj-repos" "robbyrussell" "sammy" "simple" "skaro" "smt" "sonicradish" "sorin" "steeef" "strug" "sunaku" "sunrise" "superjarin" "suvash" "takashiyoshida" "theunraveler" "tjkirch" "tjkirch_mod" "tonotdo" "trapd00r" "wedisagree" "wezm" "wezm+" "wuffers" "xiong-chiamiov" "xiong-chiamiov-plus" "zhann" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
plugins=(
  ag
  asdf
  bundler
  colored-man-pages
  docker
  gem
  git
  git-open
  mix
  npm
  pip
  rails
  rvm
  safe-paste
  themes
  timer
  vi-mode
  zsh-navigation-tools
)

# User configuration

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
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias py=python3

# load oh-my-zsh, ignoring all aliases from it's plugins
save_aliases=$(alias -L)
source $ZSH/oh-my-zsh.sh
unalias -a; eval $save_aliases; unset save_aliases

. /opt/homebrew/opt/asdf/libexec/asdf.sh

eval "$(direnv hook zsh)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

function iterm2_print_user_vars() {
  iterm2_set_user_var current_dir $(pwd | xargs basename)
}

alias itab="open -a iTerm"

function fsed() {
  find $1 -type f -exec sed -i '' $2 {} \;
}

DISABLE_AUTO_TITLE="true"

precmd() {
  # sets the tab title to current dir
  echo -ne "\e]1;${PWD##*/}\a"
}

# hide ruby version from ps1
function ruby_prompt_info() { echo '' }

if [[ $TMUX_PANE ]]; then
  HISTFILE=$HOME/.tmux/history/${TMUX_PANE:1}
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/dz/dev/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/dz/dev/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/dz/dev/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/dz/dev/google-cloud-sdk/completion.zsh.inc'; fi
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

export ERL_AFLAGS="-kernel shell_history enabled"

export RIPGREP_CONFIG_PATH=~/.ripgreprc
