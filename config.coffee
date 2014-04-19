path = require('path')

module.exports =
  name: 'Top Friends'
  themes:
    pink: t('Rosinha')
    amelia: t('Amelia')
    ubuntu: t('Ubuntu')
    yeti: t('Gelado')
    slate: t('Cinzento')
    default: t('Padrão')
    white: t('Branco')
  default_theme: 'default'
  viewsDir: path.join(__dirname, 'views')
