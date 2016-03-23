"""
- `File`: password.py

- `Description`: Authentication challenge 1: Password
"""


import webapp2
from google.appengine.ext.webapp import template
import os
import constants

class SignUp(webapp2.RequestHandler):
    def get(self):
        
        self.response.write(
            template.render(
                os.path.join(constants.TPL_DIR, 'password.tpl'),
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
                        'name': 'Password',
                        'href': '/authentication/password',
                        'active': True,
                    }],
                    'isSignUp': True,
                    'isLogin': False,
                    'isSucceeded': False,
                    'isStarted': False
                }
            )
        )

class PasswordLogin(webapp2.RequestHandler):
    def post(self):
        name = self.request.get('name')
        pw = self.request.get('pw')
        
        result = False
        msg = "start "
        if name == 'mary':
            if pw == '7':
                result = True
        
        isLogin = True
        if result == True:
            isLogin = False

        self.response.write(
            template.render(
                os.path.join(constants.TPL_DIR, 'password.tpl'),
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
                        'name': 'Password',
                        'href': '/authentication/password',
                        'active': True,
                    }],
                    'isSignUp': False,
                    'isLogin': isLogin,
                    'isSucceeded': result,
                    'isStarted': True

                }
            )
        )
    def get(self):
        
        self.response.write(
            template.render(
                os.path.join(constants.TPL_DIR, 'password.tpl'),
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
                        'name': 'Password',
                        'href': '/authentication/password',
                        'active': True,
                    }],
                    'isSignUp': False,
                    'isLogin': True,
                    'isStarted': False
                }
            )
        )

class PasswordHandler(webapp2.RequestHandler):
    """Handler for /authentication/password
    """
    def get(self):
        self.response.write(
            template.render(
                os.path.join(constants.TPL_DIR, 'password.tpl'),
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
                        'name': 'Password',
                        'href': '/authentication/password',
                        'active': True,
                    }],
                    'isSignUp': False,
                    'isLogin': True,
                    'isStarted': False
                }
            )
        )
