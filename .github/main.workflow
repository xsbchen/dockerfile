workflow "docker build" {
  on = "push"
  resolves = ["GitHub Action for Docker"]
}

action "GitHub Action for Docker" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  args = "build --build-arg BUILD_DATE=`date -u +\"%Y-%m-%dT%H:%M:%SZ\"` --build-arg VCS_REF=`git rev-parse --short HEAD` --build-arg VERSION=`cat asuswrt-merlin.ng-build/VERSION` -t xsbchen/asuswrt-merlin.ng-build asuswrt-merlin.ng-build"
}
