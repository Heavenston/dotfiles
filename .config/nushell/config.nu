# Env variables

$env.EDITOR = "helix"
$env.PATH = ($env.PATH | prepend $"($env.HOME)/.local/bin")

# Renames/Overrides
alias hx = helix
alias cat = bat -p

# Conveniances
alias g = git
alias cls = clear
def c [] { clear ; ls -a }

def --env ddc [] { cd $'(fd . -H --type directory | fzf)' }
def --env dc [] { cd ~; ddc }

def --env mkcd [name: string] {
  mkdir $name
  cd $name
}
