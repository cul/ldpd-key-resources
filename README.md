# Key Resources

An application for creating and querying for web resources (descriptions + links).

## Requirements

- Ruby 2.5
- Sqlite3 or MySQL (tested with MySQL 5.5)

## First-Time Setup (for developers)

```
git clone git@github.com:cul/ldpd-key-resources.git # Clone the repo
cd ldpd-key-resources # Switch to the application directory
bundle install # Install gem dependencies
yarn install # this assumes you have node and yarn installed (tested with Node 8 and Node 10)
...TODO: Add additional steps...
rails s -p 3000 # Start the application using rails server
```
For faster React app recompiling during development, set up a Vite server

### Setting Up A Vite Server
1. Install `nvm` (Node Version Manager) if you do not already have it with `brew install nvm`
2. Follow the [instructions](https://github.com/nvm-sh/nvm?tab=readme-ov-file#calling-nvm-use-automatically-in-a-directory-with-a-nvmrc-file) from the nvm repo to set up automatic Node version switching
3. Open a new terminal window at the repo — this should automatically switch you to run the `node` version specified by `.nvmrc` and download it if necessary.
4. Install yarn with `npm install --global yarn`
5. Install Javascript dependencies with `yarn install`.
6. Run the vite server `yarn start:dev` - this will handle asset imports for the app.

Then navigate to http://localhost:3000 in your browser.

## Deployment
We use Capistrano for deployment. To deploy to our temporary dev instance run:
```
cap dev deploy
```
