# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
    # Shell is non-interactive.  Be done now!
    return
fi

source_scripts() {
  for script in "$@"; do
    # skip non-executable snippets
    [ -x "$script" ] || continue
      # execute $script in the context of the current shell
      source $script
  done
}

# VI mode
set -o vi

export BUNDLE_GITHUB__COM=

source_scripts ~/.bashrc.d/{history,locale,fzf,git,aliases,rbenv,prompt,custom_functions,sdkman-init.sh}
