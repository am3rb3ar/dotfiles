function _cache_tool_init --description "Cache a tool's shell init output, regenerating when version changes"
    # Usage: _cache_tool_init <name> <version> <init_cmd...>
    set -l name $argv[1]
    set -l app_version $argv[2]
    set -l init_cmd $argv[3..]
    set -l cache_dir "$XDG_CACHE_HOME/fish"
    set -l cache_file "$cache_dir/$name.fish"
    set -l version_file "$cache_dir/{$name}_version"

    if not test -f $cache_file; or not test -f $version_file; or test (cat $version_file 2>/dev/null) != "$app_version"
        mkdir -p $cache_dir
        $init_cmd > $cache_file
        echo $app_version > $version_file
    end
    source $cache_file
end
