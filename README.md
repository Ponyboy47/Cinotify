# inotify
inotify module for swift

Allows using the GNU inotify library in swift.

This module uses the default GNU inotify library header for Ubuntu 16.04 x86_64 architecture.

## Installation
Add the following dependency to your Package.swift
```swift
.Package(url: "https://github.com/Ponyboy47/inotify.git", majorVersion: 1)
```

## Usage
Just like in C, only swifty
```swift
import inotify

let filedescriptor = inotify.inotify_init()

let watchedDescriptor = inotify.inotify_add_watch(filedescriptor, "~/", UInt32(inotify.IN_ALL_EVENTS))

// More usage examples later
```

use `man inotify` or google to learn how to use inotify
