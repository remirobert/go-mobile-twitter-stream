# go-mobile-twitter-stream

![bitrise](https://www.bitrise.io/app/98b44028945a98e9.svg?token=83SHwxOjANc0nCPIUqePxw)
[![codecov](https://codecov.io/gh/remirobert/go-mobile-twitter-stream/branch/master/graph/badge.svg)](https://codecov.io/gh/remirobert/go-mobile-twitter-stream)
[![codebeat](https://codebeat.co/badges/8bdf5923-d605-4755-a586-66b7a69ec71b)](https://codebeat.co/projects/github-com-remirobert-go-mobile-twitter-stream-master)

Go-mobile cross plateform framework, to get a live twitter stream.

# Build the framework
First you need to install go-mobile, then:
```sh
gomobile bind --target=ios twitter-stream-framework/
```
That will generate a framework **Twitter.framework**

# iOS client
 - AsyncDisplayKit / Texture
 - SnapshotTests and unit tests
 - Wireframe, to encapsulate UI API like UIKit, so the coordinators can be used on OSX, TVOS and iOS


![](https://user-images.githubusercontent.com/3276768/30344657-80f6f1ea-9802-11e7-9c4a-e8e3c49c6148.gif)
