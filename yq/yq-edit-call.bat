@cls
yq -i ".employed = False" yaml.yml
git diff yaml.yml
git checkout -- yaml.yml
@pause