set fish_key_bindings fish_user_key_bindings

set -x CVSROOT ":ext:henry@cvs.fsl.cs.sunysb.edu:/scm/cvsroot"
set -x CVS_RSH "/usr/bin/ssh"

set -e fish_greeting

if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR -eq 1
        exec startx -- -keeptty
    end
end
