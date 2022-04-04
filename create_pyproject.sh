mkdir $argv

cd $argv

python3 -m virtualenv venv

echo "source ./venv/bin/activate" > .envrc
echo "# This should always be the last line" >> .envrc
echo "unset PS1" >> .envrc

direnv allow

echo "flake8" > requirements.txt
echo "yapf" >> requirements.txt
echo "python-language-server" >> requirements.txt
