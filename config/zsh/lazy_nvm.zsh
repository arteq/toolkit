# Lazy-load NVM: nvm.sh costs ~200 ms, so only load it on first use of
# nvm/node/npm/npx. The wrappers remove themselves, load the real nvm,
# then re-dispatch the original command with its arguments.

export NVM_DIR="$HOME/.nvm"

_lazynvm_cmds=(nvm node npm npx)

_lazynvm_load() {
  # Remove the wrappers first so the real commands are not shadowed
  # (otherwise the wrappers would call themselves recursively)
  unset -f "${_lazynvm_cmds[@]}" 2>/dev/null

  [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
  [[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"
}

for _cmd in "${_lazynvm_cmds[@]}"; do
  eval "${_cmd}() {
    _lazynvm_load
    ${_cmd} \"\$@\"
  }"
done
unset _cmd
