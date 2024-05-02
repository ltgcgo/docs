# Versioning
## Semantic versioning
Visit [semver.org](https://semver.org) for more information.

## Decaday versioning
Inspired by Minecraft's snapshot versioning appraoch, decaday versioning is used for projects releasing snapshots, where the versioning follows the `YYYYdDDx`, where `YYYY` denotes the full year, `d` can either be `d` or `m` in different projects (due to historical mistakes...), `DD` denotes the decaday of the year, and `x` denotes the ever-increasing alphabetical index of snapshot versions.

"Decaday" is a way of dividing months to three roughly equal portions, where it usually tries to group 10 days as a "decaday". In a typical month, the 1st to the 10th day belongs to the first decaday, the 11th to the 20th belongs to the second, and the 21st to the 30th belongs to the third. If a month has 31 days, the 31st day belongs to the third decaday. This approach avoids the problem of different choices in a week's starting point.

Take `2023d30b` as an example. `2023` means the snapshot was released in 2023, `30` means the snapshot was released between 21st October and 31st October, and `b` indicates the version was released as the second snapshot between the time period.