"use strict";

angular.module('razberi', []);
angular.module('razberi.services', []);

var app = angular.module('app', [
    'ngRoute',
    'razberi',
    'razberi.services'
]);

var config = {

    user: {
        isAuthenticated: false,
        roles: [],
        username: "",
        email: "",
        id: "",
        hasRole: function (id) {
            return _.contains(this.roles, id);
        }
    },

    API: {
        host: 'http://localhost:51507/' // TODO : replace with real value
    }

};

app.value('config', config);

app.config(function ($routeProvider) {
    $routeProvider
        .when('/login', {
            templateUrl: 'authentication/views/login.html',
            controller: 'LoginCtrl',
            settings: {
                hasAccess: function () {
                    return true;
                }
            }
        })
        .when('/dashboard', {
            templateUrl: 'dashboard/views/dashboard.html',
            controller: 'DashboardCtrl',
            settings: {
                hasAccess: function () {
                    return config.user.isAuthenticated;
                }
            }
        })    
        .otherwise({
            redirectTo: '/login'
        });
});

app.run(function ($rootScope, $location, userService) {

    // TODO: Check if user is already logged in (used for page refresh scenario, check cookie) and repopulate his data

    $rootScope.$on('$routeChangeStart',
            function (event, next, current) {
                if (next && next.$$route) {

                    // if the user is trying to access page which he does not have access to
                    // redirect him to login page
                    if (next.$$route.settings && !next.$$route.settings.hasAccess()) {
                        $location.path('/login');
                        return;
                    }

                }
            }
        );

});

