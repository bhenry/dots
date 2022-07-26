pip freeze --exclude-editable | xargs pip uninstall -y
pip install -r base_requirements.txt
pip freeze -r base_requirements.txt -l > requirements.txt
