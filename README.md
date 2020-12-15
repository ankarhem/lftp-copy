Used for easily deploying files with sftp in ci environment. See example `.gitlab-ci.yml` file below.

Copies files using the following command, which means it will exclude hidden files or folders, delete files that are present on server and not in repo, and update the rest of the files if they have changed.

`mirror -X .* -X .*/ --reverse --verbose --delete $FROM_DIR $TO_DIR;`

```
image: idealpink/lftp-copy:1.1.0

# define variables SSH_KEY and SSH_KEY_PUB in gitlab ci
variables:
  SSH_PORT: 1234
  SSH_HOST: 1.1.1.1
  SSH_USER: username

stages:
  - move-files
  - restart-service

move-files:
  stage: move-files
  only:
    - master
  script:
    - init_ssh
    - copy_files ./folder/in/repo/ location/on/server/

restart-service:
  image: docker:20.10.0
  stage: restart-service
  only:
    - master
  script:
    - <command to reload service / restart docker container etc>
```
