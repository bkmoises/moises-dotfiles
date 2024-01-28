if status is-interactive
    # Commands to run in interactive sessions can go here
end


# ALIAS
alias vi nvim
alias ai aichat
alias dc "docker compose"
alias start 'cmd.exe /c start'
alias cls clear
alias multi multipass
alias multi-run-test "multi stop script-test && multi restore script-test.snapshot4 -d && multi start script-test && multi exec script-test -- chmod +x Documentos/script.sh && multi exec script-test -- ./Documentos/script.sh
"

# PATH
# set -x PATH $PTH /home/moisesreis/.local/bin /home/moisesreis/.cargo/bin
# set -x JAVA_HOME /usr/lib/jvm/java-11-openjdk/
# $JAVA_HOME
# set -x SSH_AGENT_PID (ssh-agent -c)
set -x FIREFOX "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US"
