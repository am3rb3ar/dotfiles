# Override ctrl+v from clipboard paste to open editor
bind -e -M insert ctrl-v
bind -M insert ctrl-v edit_command_buffer
# Keep alt+v as well for consistency
bind -M insert alt-v edit_command_buffer

