path = require 'path'
walk = require 'walk'
util = require 'util'
files = [];
directory = walk.walk(path.join(config.viewsDir, 'frontend'), { followLinks: false });

# Meio que uma gambiarra, mas não achei uma gambiarra menos gambiarra que essa gambiarra, então viva as gambiarras

directory.on 'file', (root, stat, next) ->
  # Add this file to the list of files
  files.push path.join(root.replace(path.join(config.viewsDir, 'frontend'), ''), stat.name).replace(/^\//, '').replace(/\.jade$/, '')
  next()
  return

exports.get = (req, res) ->
  template = req.params[0]
  if files.indexOf(template) > -1
    res.render('frontend/' + template)
  else
    res.status(404).send(t('Não encontrado'))