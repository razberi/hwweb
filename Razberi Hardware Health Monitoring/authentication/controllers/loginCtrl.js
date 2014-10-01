'use strict';

angular.module('razberi')
    .controller('LoginCtrl', ['$scope', '$location', 'userService',
        function ($scope, $location, userService) {

            $scope.confirm = function () {

                userService.authenticateUser($scope.username, $scope.password,
                    function (user) {

                        // TODO : uncomment the above code and remove this, once the API become available
                        $location.path('/dashboard');
                        userService.setupIdentity(user);
                        return;

                        if (user) {
                            userService.setupIdentity(user);

                            // TODO: save config.user into cookie

                            $location.path('/dashboard');

                        } else {
                            // TODO: Invalid credentials, show alert
                        }
                    },
                    function (errorResponse) {
                        // TODO: Handle error
                    });

            };

        }
    ]);