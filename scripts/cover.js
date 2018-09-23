const { rm, cp, mkdir, exec, echo } = require('shelljs');
const chalk = require('chalk');

echo(chalk.green('1. remove old coverage reports...'));
rm('-rf', 'coverage');
rm('-rf', '.nyc_output');

echo(chalk.green('2. run test and collect new coverage...'));
exec('nyc --reporter=html npm run test');

echo(chalk.green('3. archive coverage report by version...'));
mkdir('-p', 'coverage_archive/$npm_package_version');
cp('-r', 'coverage/*', 'coverage_archive/$npm_package_version');

echo(chalk.green('4. open coverage report for preview...'));
exec('npm-run-all --parallel cover:serve cover:open');

