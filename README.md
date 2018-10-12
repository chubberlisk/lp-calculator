# LP Calculator

A life points (LP) calculator for Yu-Gi-Oh! 

To track progress, view the [GitHub Project](https://github.com/chubberlisk/lp_calculator/projects/1).

To view current deployment, visit https://lp-calculator.herokuapp.com/.

## Branches

### `master`
- Contains the production files for the Ruby on Rails application.
- Used to push to Heroku master in order to deploy
- Completed features are added to this branch from their own.

### `feature/*`
- A new feature is created under their own branch using the following naming
  convention: `feature/<feature-name>`.
- A feature branch is created from the `master` branch.
- Once the feature is completed, a pull request must be made to add to the
  `master` branch.
 
## Reminder to Self - Test-Driven Development!
1. **RED**: Write a failing test.
2. **GREEN**: Make the test pass in the simplest way possible.
3. **REFACTOR**: Refactor the code.
