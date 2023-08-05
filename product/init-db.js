const sequelize = require('./config/database');
const User = require('./models/User');

(async () => {
  await sequelize.sync({ force: true });

  // Add sample user
  await User.create({ username: 'test', password: 'test' });

  console.log('Database initialized successfully.');
})();
