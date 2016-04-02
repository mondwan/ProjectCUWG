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
        msg = "start "
        if name == 'mary':
            if pw == 'M@rY12':
                result = True
        
        isLogin = True
        if result == True:
            isLogin = False

        self.response.write(
            template.render(
                os.path.join(constants.TPL_DIR, 'hidden.tpl'),
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
                        'name': 'Hidden',
                        'href': '/authentication/hidden',
                        'active': True,
                    }],
                    'isSignUp': False,
                    'isLogin': isLogin,
                    'isSucceeded': result,
                    'isStarted': True

                }
            )
        )

class HiddenHandler(webapp2.RequestHandler):
    """Handler for /authentication/hidden
    """
    def get(self):
        self.response.write(
            template.render(
                os.path.join(constants.TPL_DIR, 'hidden.tpl'),
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
                        'name': 'Hidden',
                        'href': '/authentication/hidden',
                        'active': True,
                    }],
                    'isSignUp': False,
                    'isLogin': True,
                    'isStarted': False
                }
            )
        )
