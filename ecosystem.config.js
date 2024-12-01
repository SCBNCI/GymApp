module.exports = {
    apps: [
      {
        name: "GymApp", // Name of your application
        script: "bin/rails", // The Rails command
        args: "server -e production -b 0.0.0.0", // Arguments for starting Rails
        interpreter: "ruby", // Ensure PM2 uses Ruby to run the script
        cwd: "/home/ubuntu/GymApp", // Set the working directory
        env: {
          RAILS_ENV: "production", // Set the environment to production
        },
      },
    ],
  };
  