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
                os.path.join(
                    constants.TPL_DIR,
                    'brute_force.tpl'
                ),
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
                }
            )
        )


class PasswordHandler(webapp2.RequestHandler):
    """Handler for /authentication/password
    """
    def get(self):
        self.response.write(
            template.render(
                os.path.join(
                    constants.TPL_DIR,
                    'brute_force.tpl'
                ),
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
                    'isShowForm': True,
                    'isShowStatus': False,
                }
            )
        )

    def post(self):
        name = self.request.get('name')
        pw = self.request.get('pw')
        isSucceeded = False
        isShowForm = True

        if name == 'mary':
            if pw == '7':
                isSucceeded = True
                isShowForm = False

        self.response.write(
            template.render(
                os.path.join(
                    constants.TPL_DIR,
                    'brute_force.tpl'
                ),
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
                    'isShowStatus': True,
                    'isShowForm': isShowForm,
                    'isSucceeded': isSucceeded,
                }
            )
        )
