if status is-interactive
    # Commands to run in interactive sessions can go here

end

function yy
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# ALIAS
alias vi nvim
alias ai aichat
alias py python
alias cat bat
alias cls clear
alias ls 'exa --icons --git'
alias ws 'cmd.exe /c start'

# PATH
set -x PATH $PATH /home/moisesreis/.local/bin /home/moisesreis/.cargo/bin $JAVA_HOME
set -x JAVA_HOME /usr/lib/jvm/java-11-openjdk/
set -x SSH_AGENT_PID (ssh-agent -c)
set -x DOWNLOAD /mnt/c/Users/brandm10/Downloads
set -x EDITOR nvim

## Virutal Env Python
# set VIRTUAL_ENV /home/moisesreis/Projetos/access-control/env

## Variávies Temporárias
set -x src /home/moisesreis/Work/unimedfesp-datalake/src/unimedfesp_datalake_apps/pipelines/datalake/
set -x ddl /home/moisesreis/Work/unimedfesp-datalake/ddl/datalake/table/

set -x bronze /home/moisesreis/Work/unimedfesp-datalake/src/unimedfesp_datalake_apps/pipelines/datalake/staged
set -x silver /home/moisesreis/Work/unimedfesp-datalake/src/unimedfesp_datalake_apps/pipelines/datalake/curated/cur_progress_pub/
set -x gold /home/moisesreis/Work/unimedfesp-datalake/src/unimedfesp_datalake_apps/pipelines/datalake/trusted/tru_datalake_fesp_pub/

set -x download /mnt/c/Users/brandm10/Downloads
set -x screenshots '/mnt/c/Users/brandm10/OneDrive - Ingram Micro/Pictures/Screenshots'
