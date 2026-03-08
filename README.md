# jellyfize

Convert the name of movies and TV shows based on Jellyfin naming convention. Also set file permissions and ownership for Jellyfin media server.

[Jellyfin](https://jellyfin.org/) is a media server where you can keep all your media (movies, TV show and more) in one centralized place, and access them from different devices. Jellyfin is really good in fetching media information and metadata and it has a nice dashboard to show all these information.

Jellyfin is doing its best effort to find media information based on media file name. If you follow the file name conventions and file structures ([movie](https://jellyfin.org/docs/general/server/media/movies/)/[TV show](https://jellyfin.org/docs/general/server/media/shows/)) it helps a lot to get best results. Jellyfize will help to convert downloaded movie/TV show file name in the Jellyfin way.

Jellyfize will help you to set file permissions and ownership for Jellyfin media server. It takes care of the file permissions and ownership (jellyfin:jellyfin) for you, so you don't have to worry about it.

## Install
`$ go install github.com/m4ns0ur/jellyfize@latest`

## Run
`$ jellyfize -h`

Note that `$GOPATH/bin` should be in the path.

## Usage
```
$ jellyfize -h
Convert the name of movies and TV shows based on Jellyfin naming convention.

Usage:
  jellyfize [-]
  jellyfize [OPTION]... FILE...

Options:
  -d, --dry-run             Show result without running
  -m, --change-mode         Change file mode to 660
  -o, --change-owner        Change file owner to jellyfin:jellyfin (sudo might be needed)
  -p, --path PATH           Output path (move file to the path and then refactor)
  -s, --separate            Separate movie files in their own folders (not required for TV series)

Example:
  $ jellyfize                                        # start in interactive mode to convert file(s) name
  $ cat movie_list.txt | jellyfize                   # convert file(s) name with piping
  $ jellyfize trainwreck.mkv war.dogs.2016.mkv       # convert multiple files
  $ jellyfize the*.mkv                               # convert multiple files with wildcard
  $ jellyfize -d The.Platform.2019.720p.mkv          # dry run
  $ jellyfize -p ~/jelly The.Platform.2019.720p.mkv  # move the file to ~/jelly and convert
  $ jellyfize -m -o -s The.Platform.2019.720p.mkv    # change mode/owner and move the movie file to its own folder
  $ jellyfize -m -o The.Flash.2014.S01E01.HDTV.mkv   # change mode/owner a TV show file (would be separated in its own folder)
```

## License
MIT - see [LICENSE](LICENSE)

