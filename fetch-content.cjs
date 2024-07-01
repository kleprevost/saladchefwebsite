const { exec } = require('child_process');

exec('git clone https://github.com/kleprevost/saladchef.git content', (err, stdout, stderr) => {
  if (err) {
    console.error(`Error fetching content: ${stderr}`);
    return;
  }
  console.log(stdout);
});
