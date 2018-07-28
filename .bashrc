alias ls='ls -Ga'
alias ll='ls -Gla'
alias rm='rm -i'
cl(){
	cd $1;
	ls;
}
alias cd='cl'
