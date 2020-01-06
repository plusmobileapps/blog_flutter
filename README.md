# Overview 

Blog frontend written in Flutter with the aims of targeting Android, iOS & web. 

## Deployment 

Deployment of the web app is done using [Firebase hosting](https://firebase.google.com/docs/hosting). There is a short script [`firebasedeploy.sh`](https://github.com/plusmobileapps/blog_flutter/blob/master/firebasedeploy.sh) which will build the release project and deploy to Firebase. Be sure to have authenticated with Firebase through the CLI and setup firebase in the root folder. [Firebase Quick Start](https://firebase.google.com/docs/hosting/quickstart)
 
 Run deployment script from the project root directory: 

```$xslt
./firebasedeploy.sh 
```