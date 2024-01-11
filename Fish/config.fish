if status is-interactive
    # Commands to run in interactive sessions can go here
end


# ALIAS
alias vi nvim
alias ai aichat
alias start 'cmd.exe /c start'
alias cls clear

# PATH
set -x JAVA_HOME /usr/lib/jvm/java-11-openjdk/
set -x PATH $PTH /home/moisesreis/.local/bin /home/moisesreis/.cargo/bin $JAVA_HOME
set -x SSH_AGENT_PID (ssh-agent -c)
