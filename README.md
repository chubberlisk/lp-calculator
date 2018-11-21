# LP Calculator

A life points (LP) calculator for Yu-Gi-Oh!

- To track **progress**, view the [GitHub Project](https://github.com/chubberlisk/lp_calculator/projects/1).
- To view current **deployment**, visit https://lp-calculator.herokuapp.com/. Please note that the free trier on Heroku is being used so startup will likely be quite slow.

## Branches

### `master`
- Contains the production files for the Ruby on Rails application.
- Used to push to Heroku master in order to deploy.

### `release`
- Contains the production files that will be used for the next release for the Ruby on Rails application.
- Completed features are added to this branch from their own.
- When a release is completed, a pull request must be made to add to the
  `master` branch.

### `feature/*`
- A new feature is created under their own branch using the following naming
  convention: `feature/<feature_name>`.
- A feature branch is created from the `release` branch.
- Once the feature is completed, a pull request must be made to add to the
  `release` branch.

### `refactor/*`
- A feature that is refactored is created under their own branch using the 
  following naming convention: `refactor/<version tag>_<feature_name>`
- A refactor branch is created from the `release` branch.
- Once the refactor is completed, a pull request must be made to add to the
  `release` branch.

## Releases
- [Semantic Versioning](https://semver.org/) will be followed.
- Each **major** release will have a codename which will begin with A until Z and be named after a Yu-Gi-Oh! card owned by _Yugi Muto_.
