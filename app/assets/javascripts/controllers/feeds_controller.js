RedPandaApp.controller('FeedsController', function($scope, $http){
  index(function(data){
    $scope.feeds = data;
  });

  function index(successCallback){
    $http(
      {
        method: 'GET',
        url: 'api/feeds'
      }
    )
    .success(function(data, status, headers, config){
      successCallback(data);
    })
    .error(function(data, status, headers, config){
      switch(status){
        case 401:
          window.location = window.location.href.substring(0, window.location.href.indexOf(/#/)) + '/login?error=401';
          break;
        default:
          window.location = window.location.href.substring(0, window.location.href.indexOf(/#/)) + '/login';
          break;
      };
    });
  }

  function refresh(){
    
  }
});