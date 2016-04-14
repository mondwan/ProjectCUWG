"""
- `File`: password.py

- `Description`: Authentication challenge 1: Password
"""


import webapp2
from google.appengine.ext.webapp import template
import os
import constants


class PasswordFileHandler(webapp2.RequestHandler):
    def get(self):
        self.response.write(
            '{user:mary, pw:"M@rY12"}, {user:sam, pw:"Passw0rd"}, {user:peter, pw: "123456"}'
        )


class PasswordLogin(webapp2.RequestHandler):
    def post(self):
        name = self.request.get('name')
        pw = self.request.get('pw')

        result = False
        if name == 'mary':
            if pw == 'M@rY12':
                result = True

        isLogin = True
        if result:
            isLogin = False

        self.response.write(
            template.render(
                os.path.join(constants.TPL_DIR, 'rainbowTable.tpl'),
                {
                    'breadcrumb': [{
                        'name': 'Home',
                        'href': '/',
                        'active': False,
                    }, {
                        'name': 'Authentication',
                        'href': '/authentication',
                        'active': False,
                    }, {
                        'name': 'RainbowTable',
                        'href': '/authentication/rainbowTable',
                        'active': True,
                    }],
                    'isSignUp': False,
                    'isLogin': isLogin,
                    'isSucceeded': result,
                    'isStarted': True

                }
            )
        )


class RainbowTableHandler(webapp2.RequestHandler):
    """Handler for /authentication/rainbowTable
    """
    def get(self):
        self.response.write(
            template.render(
                os.path.join(constants.TPL_DIR, 'rainbowTable.tpl'),
                {
                    'breadcrumb': [{
                        'name': 'Home',
                        'href': '/',
                        'active': False,
                    }, {
                        'name': 'Authentication',
                        'href': '/authentication',
                        'active': False,
                    }, {
                        'name': 'RainbowTable',
                        'href': '/authentication/rainbowTable',
                        'active': True,
                    }],
                    'isSignUp': False,
                    'isLogin': True,
                    'isStarted': False
                }
            )
        )
