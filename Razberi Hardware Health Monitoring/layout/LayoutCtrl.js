'use strict';

angular.module('razberi')
    .controller('LayoutCtrl', ['$scope', 'config',
        function ($scope, config) {

            var vm = this;
            
            $scope.$watch(function () { return config.user.isAuthenticated; },
                function () {
                    vm.showAuthenticatedContent = config.user.isAuthenticated;
                    console.log(vm.showAuthenticatedContent);
                });

        }
    ]);