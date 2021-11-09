process.env.NODE_ENV = process.env.NODE_ENV || 'production'

const environment = require('./environment')

webpack_compile_output = true

module.exports = environment.toWebpackConfig()