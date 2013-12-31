define [
  'angular'
  'bootstrap'
  'bootstrap.dropdown'
  'bootstrap.tooltip'
], (angular) ->
  utils = angular.module('topfriends.utils', [])
  utils.directive 'schDropdown', () ->
    return link: (scope, element) ->
      unless element.hasClass('has-dropdown')
        $(element).dropdown().addClass('has-dropdown')


  utils.directive 'schTooltip', () ->
    return (
      scope:
        schTooltip: '='
        schTooltipPlacement: '@'
      link: (scope, element) ->
        scope.$watchCollection("[schTooltipPlacement, schTooltip]", () ->
          console.log scope.schTooltipPlacement
          $(element).tooltip('destroy')
          $(element).tooltip({
            container:'body',
            placement: scope.schTooltipPlacement
          })
        )

    )