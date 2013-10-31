var RedPandaApp = angular.module('RedPandaApp', [])
                         .config(function($routeProvider){
                            $routeProvider.when('/feeds',
                              {
                                templateUrl: 'assets/feeds.html',
                                controller: 'FeedsController'
                              }
                            );
                            $routeProvider.otherwise({ redirectTo: '/feeds' });
                         });