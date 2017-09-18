# inotify
inotify module for swift

Allows using the GNU inotify library in swift.

## Installation
Add the following dependency to your Package.swift
```swift
.Package(url: "https://github.com/Ponyboy47/Cinotify.git", majorVersion: 1)
```

## Usage
Just like in C, only swifty
```swift
import Cinotify
import CSelect
import Glibc

// Create a file descriptor for inotify to use
var inotifyFileDescriptor = inotify_init()

// Set up inotify to use the file descriptor and watch for whatever inotify events you want
let watchedDescriptor = inotify_add_watch(inotifyFileDescriptor, "~/", UInt32(IN_ALL_EVENTS))

while true {
    // Get the set of file descriptors
    var fileDescriptorSet: fd_set = fd_set()
    fd_zero(&fileDescriptorSet)
    fd_setter(inotifyFileDescriptor, &fileDescriptorSet)

    // We wait here until an inotify event is triggered
    let fileDescriptor = select(FD_SETSIZE, &fileDescriptorSet, nil, nil, nil)
    if fileDescriptor > 0 {
        let bufferSize = 1024
        guard let buffer = UnsafeMutableRawPointer(malloc(bufferSize)) else {
            print("Unable to allocate memory for the buffer to read inotify events")
            return
        }
        // If we don't read inotify's buffer, then it doesn't get
        // cleared and this triggers the print infinitely
        let _ = read(self.inotifyFileDescriptor, buffer, bufferSize)
        // Trigger the event on the delegate
        print("An event was triggered!")
        // Free the buffer when we're done to prevent memory leaks
        free(buffer)
    }
}

// Close the inotify file descriptor so that it stops watching for events
Glibc.close(inotifyFileDescriptor)
// Set the inotify file descriptor to -1 to prevent accidental reuse
inotifyFileDescriptor = -1
```

use `man inotify` or google to learn how to use inotify
