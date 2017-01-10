# greek-dictionaries
## Description

Ruby script allowing the extraction of the search results from the Greek reverse dictionary that can be found [here](http://www.greek-language.gr/greekLang/modern_greek/tools/lexica/reverse/index.html). Strict search is not yet supported.

Two other dictionaries are proposed on this website, [here](http://www.greek-language.gr/greekLang/modern_greek/tools/lexica/index.html). Support for those two may be added later.

* Greek-English Dictionary (Georgacas)
* Dictionary of Standard Modern Greek (Triantafyllides)
* Reverse Index (Anastasiadi-Symeonidi)

## Usage

```sh
$ ruby reverse_dict_extract.rb έχω # returns all the words ending in "έχω"
```