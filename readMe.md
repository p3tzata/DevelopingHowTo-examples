# Add new global project
- `just create new empty project in DevelopingHowTo-examples`
- `UNcheck create git repository` 
- `please use name prefix howToDev-`
- `paste some .gitignore`

# Add new module to the one of project
`just create new module when you are in global project`

# Search to identify max free port
`grep port -r --include="application.yml" --include="application.properties"  ../../../DevelopingHowTo-examples/ | grep 8007`