# LugBench models

Models used by the [LugBench](https://github.com/Lugdunum3D/LugBench) application

## Dependencies

* `mogrify`
* `python3`
* `sed`

## Building the zips

```
make
```

## Uploading the zips

```
UPLOAD_PASSWORD="<password>" make upload
```

## Adding a model

* Add the directory (not zipped) in the root of this repository
* Optionally create a `optimize.sh` script that will optimize *in place* the model
* Add the model to the Makefile
* Commit and create a PR

# Licenses

All models in this repository are copyrighted by their rightful owners.
