## JNWLabel ##
`JNWLabel` is a light-weight wrapper around `CATextLayer` that provides an alternative to `NSTextField`, with support for accessibility.

![](http://appjon.com/assets/github/JNWLabel.png)

## Getting Started ##
`JNWLabel` behaves similarly to `UILabel`.

### Interface Builder ###
Although `JNWLabel` can be used in Interface Builder, it must be placed as a custom `NSView`, meaning text and other properties must be modified in code.

### Example ###
``` objc
JNWLabel *label = [[JNWLabel alloc] initWithFrame:someRect];
label.font = [NSFont systemFontOfSize:14];
label.text = @"Hello World!";
```

For a better idea of what you can do, please check the example project.

## Documentation ##
Full documentation is provided in the header file ([`JNWLabel.h`](JNWLabel.h)).

## Accessibility ##
`JNWLabel` by default includes support for accessibility.

## License ##
`JNWLabel` is licensed under the [MIT](http://opensource.org/licenses/MIT) license. See [LICENSE.md](LICENSE.md).


## Get In Touch ##
You can follow me on Twitter as [@willing](http://twitter.com/willing), email me at the email listed on my GitHub profile, or read my blog at [jwilling.com](http://www.jwilling.com).
