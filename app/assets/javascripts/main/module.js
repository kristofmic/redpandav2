var RedPandaApp = angular.module('RedPandaApp', [])
                         .config(function($routeProvider){
                            $routeProvider.when('/feeds',
                              {
                                templateUrl: 'feeds/index',
                                controller: 'FeedsController'
                              }
                            );
                            $routeProvider.when('/users/profile',
                            	{
                            		templateUrl: 'users/profile',
                            		controller: 'UsersController'
                            	}
                            );
                            $routeProvider.otherwise({redirectTo: '/feeds'});
                         });