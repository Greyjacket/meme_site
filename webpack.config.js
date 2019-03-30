/* webpack.config.js */
module.exports = {
  /* ... */
  module: {
    rules: [
      {
        test: /\.jsx?$/,
        /* We'll leave npm packages as is and not
           parse them with Babel since most of them
           are already pre-transpiled anyway. */
        exclude: /node_modules/,
        use: 'babel-loader'
      }
    ]
  }
}
