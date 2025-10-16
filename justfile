default:
	just --list

update_brewfile:
	brew bundle dump --no-vscode -f --describe

check_brewfile:
	brew bundle check
