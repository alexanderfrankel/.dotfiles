
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export NVM_DIR="/Users/alexanderfrankel/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvmalias produrl="ssh -i ~/.ssh/`whoami`_audit_db_dsa `whoami`@`dig +short auditdb.vts.com | grep -E ^[0-9].*[0-9]` './create_temp_creds.sh'"
