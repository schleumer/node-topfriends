r = require("./lib/r")
i18n = require('i18n')
i18n.configure(
  locales: ['ptBR', 'en'],
  defaultLocale: 'ptBR',
  directory: __dirname + '/locales'
)
GLOBAL.t = i18n.__

GLOBAL.r = r
GLOBAL.config = r("/config")


module.exports = (grunt) ->
  grunt.initConfig
    clean: [
      'public/css/',
      'public/js/'
    ]
    concurrent:
      dev:
        tasks: [
          'watch',
          'nodemon'
        ]
        options:
          logConcurrentOutput: true
    watch:
      styles:
        files: [
          'src/less/**/*.less',
          'src/coffee/**/*.coffee'
        ]
        tasks: [
          'less', 'coffee', 'uglify'
        ]
    less:
      development:
        options:
          paths: [
            'src/less/'
          ]
          compress: true
          yuicompress: true
          optimization: 2
        files:
          'public/css/themes/default.css': 'src/less/themes/default.less'
    coffee:
      glob_to_multiple:
        expand: true
        flatten: true
        compress: true
        cwd: 'src/coffee'
        src: [
          '*.coffee'
        ]
        dest: 'public/js/'
        ext: '.js'
    uglify:
      my_target:
        files: [
          expand: true
          cwd: "public/js"
          src: "**/*.js"
          dest: "public/js"
          ext: ".min.js"
        ]
    nodemon:
      dev:
        options:
          file: 'server.coffee'
#					nodeArgs: [
#						'--debug'
#					]
          env:
            PORT: '3000'

  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-nodemon'
  grunt.loadNpmTasks 'grunt-concurrent'
  grunt.registerTask 'default', ['less', 'coffee', 'concurrent']
  grunt.registerTask 'dev', ['clean', 'less:compile', 'watch:styles']
