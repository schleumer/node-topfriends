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
    clean:
      css: ['public/css/**/*.css']
      js: ['public/js/**/*.js']
    concurrent:
      dev:
        tasks: [
          'nodemon',
          'watch'
        ]
        options:
          logConcurrentOutput: true
    watch:
      styles:
        files: [
          'src/less/**/*.less'
        ]
        tasks: [
          'clean:css', 'less'
        ]
      coffee:
        files: [
          'src/coffee/**/*.coffee'
        ]
        tasks: ['clean:js', 'coffee', 'uglify']
      libs:
        files: [
          'src/libs/**/*'
        ]
        tasks: ['copy:libs']
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
          'public/css/themes/amelia.css': 'src/less/themes/amelia.less'
          'public/css/themes/ubuntu.css': 'src/less/themes/ubuntu.less'
          'public/css/themes/pink.css': 'src/less/themes/pink.less'
          'public/css/themes/slate.css': 'src/less/themes/slate.less'
          'public/css/themes/yeti.css': 'src/less/themes/yeti.less'
    coffee:
      glob_to_multiple:
        expand: true
        compress: true
        cwd: 'src/coffee'
        src: [
          '**/*.coffee'
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
    copy:
      libs:
        expand: true
        cwd: 'src/libs'
        src: ['**']
        dest: 'public/libs'
      templates:
        expand: true
        cwd: 'src/templates'
        src: ['**']
        dest: 'public/templates'
    nodemon:
      dev:
        script: 'server.coffee'
        options:
          ignoredFiles: ['node_modules/**', 'src/**', 'public/**', '.git/**']
          watchedExtensions: ['coffee']
          env:
            PORT: '9000'

  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-nodemon'
  grunt.loadNpmTasks 'grunt-concurrent'
  grunt.registerTask 'default', ['clean', 'less', 'coffee', 'uglify', 'copy', 'concurrent']
  grunt.registerTask 'dev', ['clean', 'less:compile', 'watch:styles']
