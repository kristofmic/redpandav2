RedPandaApp.directive('masonry', function(){
	return {
		restrict: 'C',
		link: function(scope, elem, attrs, controller){
			$(elem).masonry({columnWidth: '.brick', itemSelector: '.brick'});
		}
	};
});

RedPandaApp.directive('brick', function($timeout){
	return {
		restrict: 'C',
		link: function(scope, elem, attrs, controller){
			$timeout(function(){
				$(elem).parents('.masonry').masonry('reloadItems');
				$(elem).parents('.masonry').masonry('layout');
			}, 0);
		}
	};
});