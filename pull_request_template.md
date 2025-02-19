## Purpose of this PR

> **NOTE** Make sure to select the items relevant to your PR by placing an "x" in the brackets. *Delete* the parts that are left empty. This way the progress tracker accurately reflects the status of the PR. Leave *unfinished* elements in the checklist unchecked so we know how far along you are

## Type of change

### Parts concerned:
- [ ] Code
- [ ] Documentation
- [ ] Input Data
- [ ] Other

### Impact:
- [ ] Bug fix
- [ ] Refactoring
- [ ] New feature
- [ ] Minor change (default scenarios show only small differences)
- [ ] Fundamental change
- [ ] This change requires a documentation update

## Checklist:

- [ ] My code follows the [coding etiquette](https://github.com/remindmodel/remind/blob/develop/main.gms#L80)
- [ ] I performed a self-review of my own code
- [ ] I explained my changes within the PR, particularly in hard-to-understand areas
- [ ] I checked that the [in-code documentation](https://github.com/remindmodel/remind/blob/develop/main.gms#L120) is up-to-date
- [ ] I adjusted the reporting in [`remind2`](https://github.com/pik-piam/remind2) where it was needed
- [ ] I adjusted `forbiddenColumnNames` in [readCheckScenarioConfig.R](https://github.com/remindmodel/remind/blob/develop/scripts/start/readCheckScenarioConfig.R) in case the PR leads to deprecated switches
- [ ] I checked the `log.txt` file of my runs for newly introduced summation, fixing or variable name errors
- [ ] All automated model tests pass, executed after my final commit (`FAIL 0` in the output of `make test`)
- [ ] The changelog `CHANGELOG.md` [has been updated correctly](https://gitlab.pik-potsdam.de/rse/rsewiki/-/wikis/Standards-for-Writing-a-Changelog)

## Further information (optional):

* Runs with these changes are here:
* Comparison of results (what changes by this PR?): 
