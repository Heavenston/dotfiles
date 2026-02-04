# Env variables

$env.config.edit_mode = 'vi'
$env.config.history.max_size = 1_000_000
$env.config.show_banner = false

$env.EDITOR = "helix"
$env.PATH = ($env.PATH | prepend $"($env.HOME)/.local/bin")

$env.BUN_INSTALL = $"($env.HOME)/.bun"
$env.PATH = ($env.PATH | prepend $"($env.BUN_INSTALL)/bin")

# Starship setup
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

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
