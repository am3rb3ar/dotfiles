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
  if command -q wt
    set -l cache_dir "$XDG_CACHE_HOME/fish"
    set -l cache_file "$cache_dir/wt_init.fish"
    set -l version_file "$cache_dir/wt_version"
    set -l current_version (wt --version 2>/dev/null)
    if not test -f $cache_file; or not test -f $version_file; or test (cat $version_file 2>/dev/null) != "$current_version"
      mkdir -p $cache_dir
      wt config shell init fish > $cache_file
      echo $current_version > $version_file
    end
    source $cache_file
  end

  # cache kubectl completions — regenerates automatically when kubectl version changes
  if command -q kubectl
    set -l cache_dir "$XDG_CACHE_HOME/fish"
    set -l cache_file "$cache_dir/kubectl_completions.fish"
    set -l version_file "$cache_dir/kubectl_version"
    set -l current_version (kubectl version --client --short 2>/dev/null; or kubectl version --client 2>/dev/null | head -1)
    if not test -f $cache_file; or not test -f $version_file; or test (cat $version_file 2>/dev/null) != "$current_version"
      mkdir -p $cache_dir
      kubectl completion fish > $cache_file
      echo $current_version > $version_file
    end
    source $cache_file
  end

  # status line: https://starship.rs/
  command -q starship && starship init fish | source
end
