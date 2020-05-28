module.exports = {
  css: {
    loaderOptions: {
      less: {
        lessOptions: {
          modifyVars: {
            "primary-color": "#008080",
            "link-color": "#008080",
            "border-radius-base": "2px",
          },
          javascriptEnabled: true
        }
      }
    }
  },
  productionSourceMap: false
};