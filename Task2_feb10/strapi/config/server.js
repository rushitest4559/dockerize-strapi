module.exports = ({ env }) => ({
  host: '0.0.0.0',   // 👈 REQUIRED for Docker
  port: env.int('PORT', 1337),
  app: {
    keys: env.array('APP_KEYS'),
  },
});
