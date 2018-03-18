# HMAC for Game Maker Language

A couple of scripts related to creating a HMAC (hash-based message authentication code).

Wikipedia Explaination: [https://en.wikipedia.org/wiki/HMAC](https://en.wikipedia.org/wiki/HMAC).

## Quick start

- Import the scripts you require into your project.
- Call them, they will all follow the structure buffer_hmac_{hashtype}(buffer, offset, size, key)

## Requirements

* Game Maker Studio 2 (Untested in GMS1)

## Contributing

If you would like to help implement buffer_hmac_sha256 and buffer_hmac_sha512 scripts, I'd happily put them into repository.

A user on the YoYoGames Forums has a HMAC-SHA512 implementation here, however it might require some effort to port it / test it.
[https://forum.yoyogames.com/index.php?threads/solved-sha512-hmac-script.31253/](https://forum.yoyogames.com/index.php?threads/solved-sha512-hmac-script.31253/)

# Credits

- [JujuAdams](https://www.reddit.com/r/gamemaker/comments/42dkts/hmacsha1_implementation_in_native_gml/) for their `scr_juju_hmac_sha1_no_dependencies(key, string)` script to use as an example.
- [mimsi](https://forum.yoyogames.com/index.php?threads/solved-sha512-hmac-script.31253/) for their HMAC SHA512 implementation.
- [Gdrooid](https://en.wikipedia.org/wiki/HMAC#/media/File:SHAhmac.svg) for their diagram of SHA1-HMAC generation. (Screenshot used for GM Marketplace)
