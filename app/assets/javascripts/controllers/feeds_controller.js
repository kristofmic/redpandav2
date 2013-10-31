RedPandaApp.controller('FeedsController', function($scope, $http){
  index(function(data){
    $scope.feeds = data;
    //var container = document.getElementById('container');
    //var msnry = new Masonry( container, {columnWidth: 200, itemSelector: '.feed-item'});
  });

  function index(successCallback){
    $http({
      method: 'GET',
      url: 'api/feeds'
    })
    .success(function(data, status, headers, config){
      successCallback(data);
    })
    .error(function(data, status, headers, config){
      $log.warn(data, status, headers(), config);
    });
  }
});