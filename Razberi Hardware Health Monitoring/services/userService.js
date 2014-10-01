'use strict';

angular.module('razberi.services').factory('userService', ['$http', function ($http) {

    return {

        authenticateUser: function (username, password, onSuccess, onError) {
            //$http.post(config.API.host + 'api/user/authenticate', { username: username, password: password })
            //    .success(function (response, status) {
            //        if (onSuccess) {
            //            if (response.success) {
            //                onSuccess(response.result);
            //            } else {
            //                console.log(response.error);
            //                onSuccess(null);
            //            }
            //        }
            //    })
            //    .error(function (response, status) {
            //        console.log(response, status);
            //        if (onError) {
            //            onError(null);
            //        }
            //    });

            return onSuccess({
                username: "Reuf",
                email: "reuf@gmail.com",
                id: 1,
                role: 1
            }); // TODO : uncomment the above code and remove this, once the API become available
        },

        setupIdentity: function (user) {
            config.user.isAuthenticated = true;
            config.user.username = user.username;
            config.user.email = user.email;
            config.user.id = user.id;
            config.user.roles.push(user.role);
        },

        logout: function () {
            config.user.isAuthenticated = false;
            config.user.username = '';
            config.user.email = '';
            config.user.id = '';
            config.user.roles = [];
        }

    };

}
]);