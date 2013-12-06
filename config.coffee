path = require('path')

module.exports =
  name: 'Top Friends'
  themes:
    pink: t('Rosinha')
    amelia: t('Amelia')
    superhero: t('Superhero')
    ubuntu: t('Ubuntu')
    default: t('Padrão')
  viewsDir: path.join(__dirname, 'views')