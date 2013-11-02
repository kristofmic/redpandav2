RedPandaApp.controller('UsersController', function($scope, $http){
	show(function(response){
		$scope.user = response;
	});

	function show(successCallBack){
		$http(
			{
				method: 'GET',
				url: 'api/users/show'
			}
		)
		.success(function(data, status, headers, config){
			successCallBack(data);
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
});