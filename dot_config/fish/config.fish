# homebrew
/opt/homebrew/bin/brew shellenv | source

# local scripts
fish_add_path "$HOME/.local/bin"

command -q fzf && fzf --fish | source
# --no-rehash skips the expensive rehash subprocess on every shell start;
# run `pyenv rehash` / `goenv rehash` / `rbenv rehash` manually after installing a new version
command -q pyenv && pyenv init - --no-rehash fish | source
command -q goenv && goenv init - --no-rehash fish | source
command -q rbenv && rbenv init - --no-rehash fish | source

if status is-interactive
  set -g fish_greeting ""
  fish_vi_key_bindings
  command -q fastfetch && fastfetch

  # better cd: https://github.com/ajeetdsouza/zoxide
  command -q zoxide && zoxide init fish | source

  # worktrunk: https://github.com/max-sixty/worktrunk
  # cache worktrunk completions
  command -q wt && _cache_tool_init wt (wt --version 2>/dev/null) wt config shell init fish

  # cache kubectl completions — regenerates automatically when kubectl version changes
  if command -q kubectl
    set -l kubectl_version (kubectl version --client --short 2>/dev/null; or kubectl version --client 2>/dev/null | head -1)
    _cache_tool_init kubectl $kubectl_version kubectl completion fish
  end

  # fzf.fish key bindings
  # functions -q fzf_configure_bindings && fzf_configure_bindings --variables=ctrl-alt-v --history=ctrl-alt-r
  fzf_configure_bindings --variables=ctrl-alt-v --history=ctrl-alt-r

  # status line: https://starship.rs/
  command -q starship && starship init fish | source
end
