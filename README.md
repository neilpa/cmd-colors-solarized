Solarized - Command Prompt theme
=============================================

This is a [Solarized][1] color scheme for the Windows command prompt,
contributed by Neil Pankey.

See the [Solarized home page][1] for screenshots and more details,
as well as color schemes for other applications. To contribute or file bug
reports or issues, please visit [the GitHub repo for this port][2],
or the main [Solarized repository][3].

Inspired by this [post][4]

Installation
------------

Import the `.reg` file of choice, e.g. `regedit /s solarized-dark.reg`.

Both files contain the same palettes, the only difference is the default
foreground and background colors. Therefore you can switch between themes on
the fly with `color 81` for dark and `color F6` for light.

If you're using these themes with PowerShell (especially the light), I
recommend updating the default error and warning colors in your profile at
`~\Documents\WindowsPowerShell\profile.ps1`. Setting the background colors for
each to "White"/"Black" for light/dark respectively should do the trick, e.g.

    $Host.PrivateData.DebugBackgroundColor = "Black"
    $Host.PrivateData.ErrorBackgroundColor = "Black"

Screenshots
------------

![Dark prompt][5]

![Light prompt][6]

[1]: http://ethanschoonover.com/solarized
[2]: https://github.com/neilpa/cmd-colors-solarized
[3]: https://github.com/altercation/solarized
[4]: https://github.com/altercation/solarized/issues/127
[5]: https://raw.github.com/neilpa/cmd-colors-solarized/master/cmd-dark.png
[6]: https://raw.github.com/neilpa/cmd-colors-solarized/master/cmd-light.png
