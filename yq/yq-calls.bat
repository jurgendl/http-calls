:: https://mikefarah.gitbook.io/yq
:: https://spacelift.io/blog/yaml
:: https://docs.ansible.com/ansible/latest/reference_appendices/YAMLSyntax.html
@cls
yq ".foods" yaml.yml
yq ".education" yaml.yml
yq -i ".employed = False" yaml.yml
git diff yaml.yml
@pause