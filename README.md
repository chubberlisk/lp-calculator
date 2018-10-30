# LP Calculator

A life points (LP) calculator for Yu-Gi-Oh!

- To track **progress**, view the [GitHub Project](https://github.com/chubberlisk/lp_calculator/projects/1).
- To view current **deployment**, visit https://lp-calculator.herokuapp.com/.

## Branches

### `master`
- Contains the production files for the Ruby on Rails application.
- Used to push to Heroku master in order to deploy.
- Completed features are added to this branch from their own.

### `feature/*`
- A new feature is created under their own branch using the following naming
  convention: `feature/<feature_name>`.
- A feature branch is created from the `master` branch.
- Once the feature is completed, a pull request must be made to add to the
  `master` branch.

### `refactor/*`
- A feature that is refactored is created under their own branch using the 
  following naming convention: `refactor/<version tag>_<feature_name>`
- A refactor branch is created from the `master` branch.
- Once the refactor is completed, a pull request must be made to add to the
  `master` branch.

## Releases
- [Semantic Versioning](https://semver.org/) will be followed.
- Each **major** release will have a codename which will begin with A until Z and be named after a Yu-Gi-Oh! card owned by _Yugi Muto_.
