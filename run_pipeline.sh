oc apply -f .tekton/tasks
oc apply -f .tekton/pipeline.yaml

tkn pipeline start ci-gitops-pipeline \
  -p repo-url="git@github.com:bscp7/python-webapp.git" \
  -p image-url="docker.io/bhaveshscp/python-image" \
  -p gitops-repo-url="git@github.com:bscp7/python-webapp.git" \
  -p app-name=mywebapp \
  -p gitops-branch=main \
  -w name=shared-workspace,volumeClaimTemplateFile=./pvc.yaml \
  -w name=ssh-creds,secret=git-ssh-key

